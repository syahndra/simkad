@extends('layouts.app', ['title' => 'Edit Respon', 'menu' => 'respon'])

@section('content')
<section class="tab-components">
    <div class="container-fluid">
        <div class="title-wrapper pt-30">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h2>Edit Respon Ajuan {{ ucfirst($respon->jenis) }}</h2>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb float-end">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                        <li class="breadcrumb-item"><a>Respon Ajuan</a></li>
                        <li class="breadcrumb-item active">Edit</li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="form-elements-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-style mb-30" style="min-height: 650px; overflow: auto;">
                        @if(session('success'))
                        <div class="alert alert-success">{{ session('success') }}</div>
                        @endif

                        @if ($errors->any())
                        <div class="alert alert-danger">
                            <strong>Terjadi kesalahan!</strong>
                            <ul class="mb-0 mt-1">
                                @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                        @endif

                        <div class="mb-3">
                            <label>Operator Desa</label>
                            <input type="text" class="form-control" value="{{ $operatorDesa->user->nama }} - {{ $operatorDesa->desa->namaDesa }} ({{ $operatorDesa->desa->kecamatan->namaKec }})" disabled>
                        </div>

                        @if($respon->jenis === 'capil')
                        <div class="mb-3">
                            <label>Layanan</label>
                            <select class="form-control" disabled>
                                @foreach ($layanan as $l)
                                <option value="{{ $l->idLayanan }}" {{ $l->idLayanan == $ajuan->idLayanan ? 'selected' : '' }}>
                                    {{ $l->namaLayanan }}
                                </option>
                                @endforeach
                            </select>
                        </div>
                        @endif

                        <div class="mb-3"><label>No KK</label><input class="form-control" value="{{ $ajuan->noKK }}" disabled></div>
                        <div class="mb-3"><label>NIK</label><input class="form-control" value="{{ $ajuan->nik }}" disabled></div>

                        @if($respon->jenis === 'capil')
                        <div class="mb-3"><label>No Akta</label><input class="form-control" value="{{ $ajuan->noAkta }}" disabled></div>
                        @endif

                        <div class="mb-3"><label>Nama</label><input class="form-control" value="{{ $ajuan->nama }}" disabled></div>
                        <div class="mb-3"><label>Keterangan</label><textarea class="form-control" disabled>{{ $ajuan->keterangan }}</textarea></div>

                        <form action="{{ route('respon.update', $respon->idRespon) }}" method="POST">
                            @csrf
                            @method('PUT')

                            <div class="mb-3">
                                <label>Tindak Lanjut</label>
                                <select name="statAjuan" class="form-control" required>
                                    <option disabled selected>-- Pilih Tindak Lanjut --</option>
                                    <option value="disetujui" {{ $ajuan->statAjuan === 'disetujui' ? 'selected' : '' }}>Disetujui</option>
                                    <option value="ditolak" {{ $ajuan->statAjuan === 'ditolak' ? 'selected' : '' }}>Ditolak</option>
                                </select>
                            </div>

                            <div class="form-group mb-3">
                                <label for="respon">Ubah Respon</label>
                                <textarea name="respon" id="respon" rows="4" class="form-control" required>{{ old('respon', $respon->respon) }}</textarea>
                            </div>

                            <button type="submit" class="btn btn-primary">Update Respon</button>
                            <a href="{{ url()->previous() }}" class="btn btn-secondary">Kembali</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection