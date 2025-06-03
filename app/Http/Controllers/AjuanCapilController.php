<?php

namespace App\Http\Controllers;

use App\Models\AjuanCapil;
use App\Models\Layanan;
use App\Models\OperatorDesa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AjuanCapilController extends Controller
{
    public function index()
    {
        // $user = Auth::user();

        if (Auth::user()->roleUser === 'operatorDesa') {
            $opdes = OperatorDesa::where('idUser', Auth::user()->idUser)->first();

            $ajuan = AjuanCapil::with('layanan', 'operatorDesa.desa.kecamatan','respon')
                ->whereHas('operatorDesa', function ($query) use ($opdes) {
                    $query->where('idDesa', $opdes->idDesa);
                })
                ->get();
        } else {
            $ajuan = AjuanCapil::with('layanan', 'operatorDesa.desa.kecamatan','respon')->get();
        }

        return view('ajuanCapil.index', compact('ajuan'));
    }

    public function create()
    {
        $layanan = Layanan::where('jenis', 'capil')->get();

        $user = Auth::user();
        $operatorDesa = OperatorDesa::with('desa.kecamatan', 'user')
            ->where('idUser', Auth::id())
            ->firstOrFail();

        return view('ajuanCapil.create', compact('layanan', 'operatorDesa'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'idOpdes' => 'required|exists:operatordesa,idOpdes',
            'idLayanan' => 'required',
            'noAkta' => 'nullable|string|max:50',
            'noKK' => 'required|string|max:50',
            'nik' => 'required|string|max:50',
            'nama' => 'required|string|max:100',
            'keterangan' => 'nullable|string|max:255',
        ]);
        AjuanCapil::create($request->all());

        return redirect()->route('ajuanCapil.index')->with('success', 'Ajuan berhasil ditambahkan.');
    }

    public function edit($id)
    {
        $ajuan = AjuanCapil::findOrFail($id);
        $layanan = Layanan::where('jenis', 'capil')->get();
        $operatorDesa = OperatorDesa::with('desa.kecamatan', 'user')
            ->where('idUser', Auth::id())
            ->firstOrFail();

        return view('ajuanCapil.edit', compact('ajuan', 'layanan', 'operatorDesa'));
    }

    public function update(Request $request, $id)
    {
        $ajuan = AjuanCapil::findOrFail($id);
        $request->validate([
            'idLayanan' => 'required|exists:layanan,idLayanan',
            'noKK' => 'required',
            'nik' => 'required',
            'nama' => 'required|string|max:255',
            'keterangan' => 'nullable|string',
            'noAkta' => 'nullable|string|max:50',
        ]);

        $ajuan->update($request->all());

        return redirect()->route('ajuanCapil.index')->with('success', 'Ajuan berhasil diperbarui.');
    }

    public function destroy($id)
    {
        AjuanCapil::findOrFail($id)->delete();
        return redirect()->route('ajuanCapil.index')->with('success', 'Ajuan berhasil dihapus.');
    }
}
