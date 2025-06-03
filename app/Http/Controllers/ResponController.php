<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AjuanCapil;
use App\Models\AjuanDafduk;
use App\Models\Respon;
use Illuminate\Support\Facades\Auth;

class ResponController extends Controller
{
    public function create($jenis, $id)
    {
        $ajuan = null;

        if ($jenis === 'capil') {
            $ajuan = AjuanCapil::with('operatorDesa.desa.kecamatan')->findOrFail($id);
        } elseif ($jenis === 'dafduk') {
            $ajuan = AjuanDafduk::with('operatorDesa.desa.kecamatan')->findOrFail($id);
        } else {
            abort(404, 'Jenis ajuan tidak dikenali');
        }

        return view('respon.create', compact('ajuan', 'jenis'));
    }
    public function store(Request $request)
    {
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
}
