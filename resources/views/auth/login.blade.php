<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="{{ asset('assets/images/Lambang_Kabupaten_Brebes.png') }}" type="image/x-icon" />
    <title>Login | Sistem Monitoring Kios Adminduk Desa</title>

    <!-- ========== All CSS files linkup ========= -->
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/css/lineicons.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/css/materialdesignicons.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/css/fullcalendar.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/css/main.css') }}" />
</head>

<body>
    <!-- ======== Preloader =========== -->
    <div id="preloader">
        <div class="spinner"></div>
    </div>
    <!-- ======== Preloader =========== -->



    <!-- ======== main-wrapper start =========== -->
    <main class="main-login">

        <!-- ========== signin-section start ========== -->
        <section class="signin-section">
            <div class="container-fluid">
                <!-- ========== title-wrapper start ========== -->
                <div class="title-wrapper pt-30">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="title">
                                <h2>Login</h2>
                            </div>
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- ========== title-wrapper end ========== -->

                <div class="row g-0 auth-row">
                    <div class="col-lg-6">
                        <div class="auth-cover-wrapper bg-primary-100">
                            <div class="auth-cover">
                                <div class="title text-center">
                                    <h1 class="text-primary mb-10">Sistem Monitoring Kios Adminduk Desa</h1>
                                    <p class="text-medium">
                                        Silahkan masuk ke akun SIMKAD untuk melanjutkan.
                                    </p>
                                </div>
                                <div class="cover-image">
                                    <img src="{{ asset('assets/images/auth/signin-image.svg') }}" alt="" />
                                </div>
                                <div class="shape-image">
                                    <img src="{{ asset('assets/images/auth/shape.svg') }}" alt="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end col -->
                    <div class="col-lg-6">
                        <div class="signin-wrapper">
                            <div class="form-wrapper">
                                <h6 class="mb-15">Form Login</h6>
                                <p class="text-sm mb-25">
                                    Silahkan masukan username dan password terdaftar.
                                </p>
                                <form method="POST" action="/login">
                                    @csrf
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="input-style-1">
                                                <label>Username</label>
                                                <input name="username" type="text" placeholder="Username" />
                                            </div>
                                        </div>
                                        <!-- end col -->
                                        <div class="col-12">
                                            <div class="input-style-1">
                                                <label>Password</label>
                                                <input name="password" type="password" placeholder="Password" />
                                            </div>
                                        </div>
                                        <!-- end col -->
                                        <div class="col-xxl-6 col-lg-12 col-md-6">
                                            <div class="form-check checkbox-style mb-30">
                                                <input class="form-check-input" type="checkbox" value=""
                                                    id="checkbox-remember" />
                                                <label class="form-check-label" for="checkbox-remember">
                                                    Remember me next time</label>
                                            </div>
                                        </div>
                                        <!-- end col -->
                                        <div class="col-xxl-6 col-lg-12 col-md-6">
                                            <div class="text-start text-md-end text-lg-start text-xxl-end mb-30">
                                                <a href="reset-password.html" class="hover-underline">
                                                    Forgot Password?
                                                </a>
                                            </div>
                                        </div>
                                        <!-- end col -->
                                        <div class="col-12">
                                            <div class="button-group d-flex justify-content-center flex-wrap">
                                                <button class="main-btn primary-btn btn-hover w-100 text-center"
                                                    type="submit">
                                                    Sign In
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end row -->
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
        </section>
        <!-- ========== signin-section end ========== -->

        <!-- ========== footer start =========== -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 order-last order-md-first">
                        <div class="copyright text-center text-md-start">
                            <p class="text-sm">
                                Designed and Developed by
                                <a href="https://plainadmin.com" rel="nofollow" target="_blank">
                                    PlainAdmin
                                </a>
                            </p>
                        </div>
                    </div>
                    <!-- end col-->
                    <div class="col-md-6">
                        <div class="terms d-flex justify-content-center justify-content-md-end">
                            <a href="#0" class="text-sm">Term & Conditions</a>
                            <a href="#0" class="text-sm ml-15">Privacy & Policy</a>
                        </div>
                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </footer>
        <!-- ========== footer end =========== -->
    </main>
    <!-- ======== main-wrapper end =========== -->

    <!-- ========= All Javascript files linkup ======== -->
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/Chart.min.js') }}"></script>
    <script src="{{ asset('assets/js/dynamic-pie-chart.js') }}"></script>
    <script src="{{ asset('assets/js/moment.min.js') }}"></script>
    <script src="{{ asset('assets/js/fullcalendar.js') }}"></script>
    <script src="{{ asset('assets/js/jvectormap.min.js') }}"></script>
    <script src="{{ asset('assets/js/world-merc.js') }}"></script>
    <script src="{{ asset('assets/js/polyfill.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>
</body>

</html>
