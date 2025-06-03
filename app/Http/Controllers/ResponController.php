<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AjuanCapil;
use App\Models\AjuanDafduk;
use App\Models\Respon;
use App\Models\Layanan;
use App\Models\OperatorDesa;
use Illuminate\Support\Facades\Auth;

class ResponController extends Controller
{
    public function create($jenis, $id)
    {
        $ajuan = null;

        if ($jenis === 'capil') {
            $ajuan = AjuanCapil::with('operatorDesa.desa.kecamatan')->findOrFail($id);
            $layanan = Layanan::where('jenis', 'capil')->get();
            $operatorDesa = OperatorDesa::with('desa.kecamatan', 'user')
                ->where('idOpdes', $ajuan->idOpdes)
                ->firstOrFail();
        } elseif ($jenis === 'dafduk') {
            $ajuan = AjuanDafduk::with('operatorDesa.desa.kecamatan')->findOrFail($id);
        } else {
            abort(404, 'Jenis ajuan tidak dikenali');
        }

        return view('respon.create',  compact('ajuan', 'jenis', 'layanan', 'operatorDesa'));
    }
    public function store(Request $request)
    {

        $statAjuan = $request->statAjuan;

        if ($request->jenis === 'capil') {
            $ajuan = AjuanCapil::findOrFail($request->idAjuan);
            $ajuan->statAjuan = $request->statAjuan;
            $ajuan->save();
        } elseif ($request->jenis === 'dafduk') {
        } else {
            abort(404, 'Permintaan tidak dikenali');
        }

        $request->validate([
            'jenis'    => 'required|in:capil,dafduk',
            'idAjuan'  => 'required|integer',
            'respon'   => 'required|string',
        ]);

        Respon::create([
            'idUser'  => Auth::id(),
            'idAjuan' => $request->idAjuan,
            'jenis'   => $request->jenis,
            'respon'  => $request->respon,
        ]);

        return redirect()->route('ajuan' . ucfirst($request->jenis) . '.index')
            ->with('success', 'Respon berhasil dikirim.');
    }

    public function edit($jenis, $id)
    {
        $respon = Respon::where('idAjuan', $id)->firstOrFail();

        if ($jenis === 'capil') {
            $ajuan = AjuanCapil::with('operatorDesa.desa.kecamatan', 'layanan')->findOrFail($respon->idAjuan);
            $operatorDesa = OperatorDesa::with('user', 'desa.kecamatan')->where('idOpdes', $ajuan->idOpdes)->first();
            $layanan = Layanan::where('jenis', 'capil')->get();
        } elseif ($jenis === 'dafduk') {
            $ajuan = AjuanDafduk::with('operatorDesa.desa.kecamatan')->findOrFail($respon->idAjuan);
            $operatorDesa = OperatorDesa::with('user', 'desa.kecamatan')->where('idOpdes', $ajuan->idOpdes)->first();
            $layanan = []; // Jika tidak ada layanan khusus dafduk
        } else {
            abort(404, 'Jenis respon tidak dikenali');
        }

        return view('respon.edit', compact('respon', 'ajuan', 'operatorDesa', 'layanan'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'statAjuan' => 'required|in:disetujui,ditolak',
            'respon' => 'required|string',
        ]);

        $respon = Respon::findOrFail($id);
        $respon->update([
            'respon' => $request->respon,
        ]);

        // Update status ajuan
        if ($respon->jenis === 'capil') {
            $ajuan = AjuanCapil::findOrFail($respon->idAjuan);
        } elseif ($respon->jenis === 'dafduk') {
            $ajuan = AjuanDafduk::findOrFail($respon->idAjuan);
        } else {
            abort(404, 'Jenis respon tidak dikenali');
        }

        $ajuan->statAjuan = $request->statAjuan;
        $ajuan->save();

        return redirect()->route('ajuan' . ucfirst($respon->jenis) . '.index')
    ->with('success', 'Respon berhasil diperbarui.');
    }
}
