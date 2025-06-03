@extends('layouts.app', ['title' => 'Tambah Respon', 'menu' => 'respon'])
@section('content')
    <section class="tab-components">
        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="title">
                            <h2>Tambah Respon Ajuan {{ ucfirst($jenis) }}</h2>
                        </div>
                    </div>
                    <!-- end col -->
                    <div class="col-md-6">
                        <div class="breadcrumb-wrapper">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="{{ route('dashboard') }}">Dashboard</a>
                                    </li>
                                    <li class="breadcrumb-item"><a>Respon Ajuan {{ ucfirst($jenis) }}</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Tambah
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- ========== title-wrapper end ========== -->

            <!-- ========== form-elements-wrapper start ========== -->
            <div class="form-elements-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-style mb-30" style="min-height: 650px; overflow: auto;">
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
                            <div class="card mb-4">
                                <div class="card-body">
                                    <h5>Detail Ajuan</h5>
                                    <ul>
                                        <li><strong>Nama Pengaju:</strong> {{ $ajuan->user->nama ?? '-' }}</li>
                                        <li><strong>Jenis Layanan:</strong> {{ $ajuan->layanan->namaLayanan ?? '-' }}</li>
                                        <li><strong>Desa:</strong> {{ $ajuan->operatorDesa->desa->namaDesa ?? '-' }}</li>
                                        <li><strong>Kecamatan:</strong>
                                            {{ $ajuan->operatorDesa->desa->kecamatan->namaKecamatan ?? '-' }}</li>
                                        {{-- Tambahkan field lain jika perlu --}}
                                    </ul>
                                </div>
                            </div>

                            {{-- Form Respon --}}
                            <form action="{{ route('respon.store') }}" method="POST">
                                @csrf

                                <input type="hidden" name="idAjuan" value="{{ $ajuan->getKey() }}">
                                <input type="hidden" name="jenis" value="{{ $jenis }}">

                                <div class="form-group mb-3">
                                    <label for="respon">Tulis Respon</label>
                                    <textarea name="respon" id="respon" rows="4" class="form-control" required>{{ old('respon') }}</textarea>
                                </div>

                                <button type="submit" class="btn btn-primary">Kirim Respon</button>
                                <a href="{{ url()->previous() }}" class="btn btn-secondary">Kembali</a>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- ========== form-elements-wrapper end ========== -->
        </div>
        <!-- end container -->
    </section>
@endsection
