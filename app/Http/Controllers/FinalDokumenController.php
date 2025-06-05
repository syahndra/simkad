<?php

namespace App\Http\Controllers;

use App\Models\FinalDokumen;
use App\Models\AjuanCapil;
use App\Models\AjuanDafduk;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class FinalDokumenController extends Controller
{
    public function index()
    {
        $dokumen = FinalDokumen::all();
        return view('finalDokumen.index', compact('dokumen'));
    }

    public function create($jenis, $id)
    {
        $ajuan = null;

        if ($jenis === 'capil') {
            $ajuan = AjuanCapil::with('operatorDesa.desa.kecamatan', 'layanan')->findOrFail($id);
        } elseif ($jenis === 'dafduk') {
            $ajuan = AjuanDafduk::with('operatorDesa.desa.kecamatan', 'layanan')->findOrFail($id);
        } else {
            abort(404, 'Jenis ajuan tidak dikenali');
        }
        return view('finalDokumen.create', compact('ajuan', 'jenis'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'jenis' => 'required|in:capil,dafduk',
            'idAjuan' => 'required',
            'filename' => 'required',
            'file' => 'required|file|mimes:pdf,jpg,jpeg,png|max:2048',
        ]);

        $path = $request->file('file')->store('dokumen_final', 'public');

        FinalDokumen::create([
            'jenis' => $request->jenis,
            'idAjuan' => $request->idAjuan,
            'filename' => $request->filename,
            'filePath' => $path,
        ]);

        return redirect()->route('ajuan' . ucfirst($request->jenis) . '.index')
            ->with('success', 'Final Dokumen berhasil dikirim.');
    }

    public function edit($jenis, $id)
    {
        $finalDokumen = FinalDokumen::where('idAjuan', $id)->firstOrFail();

        if ($jenis === 'capil') {
            $ajuan = AjuanCapil::with('operatorDesa.desa.kecamatan', 'layanan')->findOrFail($finalDokumen->idAjuan);
        } elseif ($jenis === 'dafduk') {
            $ajuan = AjuanDafduk::with('operatorDesa.desa.kecamatan')->findOrFail($finalDokumen->idAjuan);
        } else {
            abort(404, 'Jenis dokumen tidak dikenali');
        }

        $jenis = $finalDokumen->jenis;

        return view('finalDokumen.edit', compact('finalDokumen', 'ajuan', 'jenis'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'filename' => 'required',
            'file' => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:2048',
        ]);

        $finalDokumen = FinalDokumen::findOrFail($id);

        $finalDokumen->filename = $request->filename;

        if ($request->hasFile('file')) {
            // Hapus file lama jika perlu
            if ($finalDokumen->filePath && Storage::disk('public')->exists($finalDokumen->filePath)) {
                Storage::disk('public')->delete($finalDokumen->filePath);
            }

            $path = $request->file('file')->store('dokumen_final', 'public');
            $finalDokumen->filePath = $path;
        }

        $finalDokumen->save();

        return redirect()->route('ajuan' . ucfirst($finalDokumen->jenis) . '.index')
            ->with('success', 'Final Dokumen berhasil diperbarui.');
    }
}
