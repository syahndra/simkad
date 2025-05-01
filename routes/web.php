<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\KecamatanController;
use App\Http\Controllers\DesaController;
use App\Http\Controllers\LayananController;

Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// Route dashboard (hanya bisa diakses kalau login)
Route::middleware(['auth'])->group(function () {
    Route::get('/', function () {
        return redirect()->route('dashboard');
    })->name('home');
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
    Route::resource('kecamatan', KecamatanController::class);
    Route::resource('desa', DesaController::class);
    Route::resource('layanan', LayananController::class);

});
