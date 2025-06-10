@extends('layouts.app', ['title' => 'Ajuan Dafduk', 'menu' => 'ajuanDafduk'])
@section('content')
    <!-- ========== table components start ========== -->
    <section class="table-components">
        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="title">
                            <h2>Daftar Pengajuan Pendaftaran Penduduk</h2>
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
                                    <li class="breadcrumb-item"><a>Pengajuan Dafduk</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        Daftar Ajuan Dafduk
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

            <!-- ========== tables-wrapper start ========== -->
            <div class="tables-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-style mb-30">
                            {{-- <h6 class="mb-10">Tabel Kecamatan</h6> --}}
                            {{-- <p class="text-sm mb-20">
                                For basic styling—light padding and only horizontal
                                dividers—use the class table.
                            </p> --}}
                            @if (session('success'))
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    {{ session('success') }}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                                        aria-label="Close"></button>
                                </div>
                            @endif

                            <a href="{{ route('ajuanDafduk.create') }}" class="btn btn-success mb-3">Tambah +</a>
                            <div class="table-responsive">
                                <table id="table" class="table">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Tgl Ajuan</th>
                                            <th>Layanan</th>
                                            <th>Nama</th>
                                            <th>NIK</th>
                                            <th>No KK</th>
                                            <th>Keterangan</th>
                                            <th>Wilayah</th>
                                            <th>Status</th>
                                            <th>#</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($ajuan as $a)
                                            <tr>
                                                <td>{{ $loop->iteration }}</td>
                                                <td>{{ \Carbon\Carbon::parse($a->layanan->created_at)->format('d-m-Y') }}
                                                </td>
                                                <td>{{ $a->layanan->namaLayanan }}</td>
                                                <td>{{ $a->nama }}</td>
                                                <td>{{ $a->nik }}</td>
                                                <td>{{ $a->noKK }}</td>
                                                <td>{{ $a->keterangan }}</td>
                                                <td>{{ $a->operatorDesa->desa->kecamatan->namaKec ?? '-' }},
                                                    {{ $a->operatorDesa->desa->namaDesa ?? '-' }}</td>
                                                <td>
                                                    <span
                                                        class="badge 
                                            {{ $a->statAjuan === 'ditolak'
                                                ? 'bg-danger'
                                                : ($a->statAjuan === 'sudah diproses'
                                                    ? 'bg-primary'
                                                    : ($a->statAjuan === 'revisi'
                                                        ? 'bg-warning'
                                                        : ($a->statAjuan === 'selesai'
                                                            ? 'bg-success'
                                                            : 'bg-secondary'))) }}">
                                                        {{ ucfirst($a->statAjuan) }}
                                                    </span>
                                                    @if ($a->respon)
                                                        {{ $a->respon->respon }}
                                                    @endif
                                                </td>
                                                <td>
                                                    @isset($a->finalDokumen->filePath)
                                                        <a href="{{ asset('storage/' . $a->finalDokumen->filePath) }}"
                                                            target="_blank" class="badge text-primary" title="Lihat Dokumen">
                                                            Dokumen
                                                        </a>
                                                    @endisset
                                                </td>
                                                <td>
                                                    <div class="action">
                                                        @if (Auth::user()->roleUser === 'operatorDesa')
                                                            @if ($a->statAjuan === 'dalam proses')
                                                                <a href="{{ route('ajuanDafduk.edit', $a->idDafduk) }}"
                                                                    class="text-warning" title="Edit Ajuan">
                                                                    <i class="lni lni lni-pencil"></i>
                                                                </a>
                                                                <form
                                                                    action="{{ route('ajuanDafduk.destroy', $a->idDafduk) }}"
                                                                    method="POST">
                                                                    @csrf @method('DELETE')
                                                                    <button onclick="return confirm('Yakin hapus?')"
                                                                        class="text-danger" title="Hapus Ajuan"><i
                                                                            class="lni lni-trash-can"></i></button>
                                                                </form>
                                                            @endif
                                                            @if ($a->statAjuan === 'ditolak')
                                                                <a href="{{ route('respon.edit', ['jenis' => 'dafduk', 'id' => $a->idDafduk]) }}"
                                                                    class="text-success" title="Ajukan Ulang">
                                                                        <i class="lni lni-reload"></i>
                                                                </a>
                                                            @endif
                                                            @if (in_array($a->statAjuan, ['sudah diproses', 'selesai']))
                                                                @isset($a->finalDokumen)
                                                                    <button>
                                                                        <a href="{{ route('finalDokumen.edit', ['jenis' => 'dafduk', 'id' => $a->idDafduk]) }}"
                                                                            class="text-warning" title="Ubah Dokumen">
                                                                            <i class="lni lni-pencil-alt"></i>
                                                                        </a>
                                                                    </button>
                                                                @else
                                                                    <button>
                                                                        <a href="{{ route('finalDokumen.create', ['jenis' => 'dafduk', 'id' => $a->idDafduk]) }}"
                                                                            class="text-primary" title="Upload Dokumen">
                                                                            <i class="lni lni lni-cloud-upload"></i>
                                                                        </a>
                                                                    </button>
                                                                @endisset
                                                            @endif
                                                            <a href="{{ route('ajuan.cetak', ['jenis' => 'dafduk', 'id' => $a->idDafduk]) }}"
                                                                class="text-secondary" title="Generate Token" target="_blank">
                                                                <i class="lni lni-cog"></i>
                                                            </a>
                                                        @elseif (in_array(Auth::user()->roleUser, ['opDinDafduk', 'operatorKecamatan']))
                                                            @if ($a->statAjuan === 'dalam proses')
                                                                <a href="{{ route('respon.create', ['jenis' => 'dafduk', 'id' => $a->idDafduk]) }}"
                                                                    class="text-primary" title="Beri Respon">
                                                                        <i class="lni lni-reply"></i>
                                                                </a>
                                                            @else
                                                                <a href="{{ route('respon.edit', ['jenis' => 'dafduk', 'id' => $a->idDafduk]) }}"
                                                                    class="text-warning" title="Ubah Respon">
                                                                        <i class="lni lni-pencil-alt"></i>
                                                                </a>
                                                            @endif
                                                        @endif
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                <!-- end table -->
                            </div>
                        </div>
                        <!-- end card -->
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- ========== tables-wrapper end ========== -->
        </div>
        <!-- end container -->
    </section>
    <!-- ========== table components end ========== -->
@endsection
