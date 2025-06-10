<!DOCTYPE html>
<html>
<head>
    <title>Token Ajuan</title>
    <style>
        body { font-family: sans-serif; text-align: center; }
        .qr-wrapper {
            width: 200px;
            margin: 20px auto;
        }
        .qr-wrapper img {
            width: 200px;
            height: 200px;
        }
    </style>
</head>
<body>
    <h2>Token Ajuan: {{ $token }}</h2>
    <p>Layanan: {{ $layanan }}</p>
    <p>Nama: {{ $nama }}</p>
    <p>Tanggal Ajuan: {{ $created_at }}</p>

    <div class="qr-wrapper">
        <img src="data:image/png;base64,{{ $barcode }}">
        {{-- <p><small>Scan untuk cek status: {{ route('cek.pengajuan', $token) }}</small></p> --}}
    </div>
</body>
</html>
