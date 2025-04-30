<aside class="sidebar-nav-wrapper">
    <div class="navbar-logo">
        <a href="index.html">
            <img src="{{ asset('assets/images/logo/simkad.svg') }}" alt="logo" />
        </a>
    </div>
    <nav class="sidebar-nav">
        <ul>
            <li class="nav-item @if ($menu == 'dashboard') active @endif">
                <a href="{{ route('dashboard') }}">
                    <i class="lni lni-dashboard icon"></i>
                    <span class="text">Dashboard</span>
                </a>
            </li>

            <li class="nav-item @if ($menu == 'Layanan') active @endif">
                {{-- <a href="{{ route('layanan.index') }}"> --}}
                <a href="#">
                    <i class="lni lni-laptop-phone icon"></i>
                    <span class="text">Daftar Layanan</span>
                </a>
            </li>

            <li class="nav-item nav-item-has-children">
                <a href="#0" class="@if ($menu != 'kecamatan') collapsed @endif" data-bs-toggle="collapse" data-bs-target="#ddmenu_kategoriwilayah"
                    aria-controls="ddmenu_kategoriwilayah" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="lni lni-map icon"></i>
                    <span class="text">Kategori Wilayah</span>
                </a>
                <ul id="ddmenu_kategoriwilayah" class="@if ($menu != 'kecamatan') collapse @endif dropdown-nav">
                    <li>
                        <a href="{{ route('kecamatan.index') }}" class="@if ($menu == 'kecamatan' ) active @endif"> Kecamatan </a>
                    </li>
                    <li>
                        <a href="desa.html"> Desa </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item nav-item-has-children">
                <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_user"
                    aria-controls="ddmenu_user" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="lni lni-users icon"></i>
                    <span class="text">Manajemen User</span>
                </a>
                <ul id="ddmenu_user" class="collapse dropdown-nav">
                    <li>
                        <a href="#"> Admin </a>
                    </li>
                    <li>
                        <a href="#">Dinas</a>
                    </li>
                    <li>
                        <a href="#">Operator Kecamatan</a>
                    </li>
                    <li>
                        <a href="#">Operator Kecamatan</a>
                    </li>
                    <li>
                        <a href="#">Operator Desa</a>
                    </li>
                </ul>
            </li>

            <span class="divider">
                <hr />
            </span>
            <li class="nav-item">
                <a href="pengajuan-pendaftaran.html">
                    <i class="lni lni-postcard icon"></i>
                    <span class="text">Pengajuan Dafduk</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="pengajuan-pencatatan.html">
                    <i class="lni lni-certificate icon"></i>
                    <span class="text">Pengajuan Capil</span>
                </a>
            </li>
            <span class="divider">
                <hr />
            </span>
            <li class="nav-item">
                <a href="{{ route('logout') }}"
                    onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    <i class="lni lni-exit icon"></i>
                    <span class="text">Sign Out</span>
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                </form>
            </li>
        </ul>
    </nav>
</aside>