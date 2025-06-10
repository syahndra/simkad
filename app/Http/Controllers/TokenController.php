<?php

namespace App\Http\Controllers;

use App\Models\AjuanCapil;
use App\Models\AjuanDafduk;
use Barryvdh\DomPDF\Facade\Pdf;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class TokenController extends Controller
{
    public function cetakToken($jenis, $id)
    {
        $ajuan = null;

        if ($jenis === 'capil') {
            $ajuan = AjuanCapil::findOrFail($id);
        } elseif ($jenis === 'dafduk') {
            $ajuan = AjuanDafduk::findOrFail($id);
        } else {
            abort(404, 'Permintaan tidak dikenali');
        }

        // $barcode = base64_encode(QrCode::format('svg')->size(200)->generate($ajuan->token));
        $qrUrl = route('cek.pengajuan', $ajuan->token);

        $barcode = base64_encode(
            QrCode::format('svg')->size(200)->generate($qrUrl)
        );

        // Data yang akan dikirim ke view cetak
        $data = [
            'nama' => $ajuan->nama ?? '-',
            'layanan' => $ajuan->layanan->namaLayanan,
            'token' => $ajuan->token,
            'created_at' => $ajuan->created_at->translatedFormat('d F Y'),
            'barcode' => $barcode,
        ];

        // Buat PDF langsung dari view
        $pdf = Pdf::loadView('token.cetak', $data);

        return $pdf->stream("Token-Ajuan-{$ajuan->token}.pdf");
        // gunakan ->download() jika ingin diunduh
    }

    public function cek($jenis, $token)
    {
        if ($jenis === 'capil') {
            $ajuan = AjuanCapil::where('token', $token)->firstOrFail();
        } elseif ($jenis === 'dafduk') {
            $ajuan = AjuanDafduk::where('token', $token)->firstOrFail();
        } else {
            abort(404, 'Permintaan tidak dikenali');
        }
    }
}
