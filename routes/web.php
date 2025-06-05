<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\KecamatanController;
use App\Http\Controllers\DesaController;
use App\Http\Controllers\LayananController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\OperatorDinasController;
use App\Http\Controllers\OperatorKecController;
use App\Http\Controllers\OperatorDesaController;
use App\Http\Controllers\AjuanDafdukController;
use App\Http\Controllers\AjuanCapilController;
use App\Http\Controllers\ResponController;
use App\Http\Controllers\FinalDokumenController;
use App\Models\FinalDokumen;

Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');


Route::middleware(['auth'])->group(function () {

    Route::get('/', function () {
        return redirect()->route('dashboard');
    })->name('home');

    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');

    Route::middleware(['checkRole:superadmin'])->group(function () {
        Route::resource('kecamatan', KecamatanController::class);
        Route::resource('desa', DesaController::class);
        Route::resource('layanan', LayananController::class);
        Route::resource('admin', AdminController::class);
    });

    Route::middleware(['checkRole:superadmin,admin'])->group(function () {
        Route::resource('operatorDinas', OperatorDinasController::class);
        Route::resource('operatorKec', OperatorKecController::class);
        Route::resource('operatorDesa', OperatorDesaController::class);
        Route::get('/getDesa-by-kecamatan/{idKec}', [OperatorDesaController::class, 'getDesaByKecamatan'])->name('getDesaByKecamatan');
    });

    Route::middleware(['checkRole:operatorDesa,operatorKecamatan,opDinDafduk'])->group(function () {
        Route::resource('ajuanDafduk', AjuanDafdukController::class);
    });

    Route::middleware(['checkRole:operatorDesa,opDinCapil'])->group(function () {
        Route::resource('ajuanCapil', AjuanCapilController::class);
    });
    Route::middleware(['checkRole:operatorDesa,opDinCapil,opDinDafduk,operatorKecamatan'])->group(function () {
        Route::get('/respon/{jenis}/{id}/create', [ResponController::class, 'create'])->name('respon.create');
        Route::post('/respon', [ResponController::class, 'store'])->name('respon.store');
        Route::get('/respon/{jenis}/{id}/edit', [ResponController::class, 'edit'])->name('respon.edit');
        Route::put('/respon/{id}', [ResponController::class, 'update'])->name('respon.update');
    });
    Route::middleware(['checkRole:operatorDesa,opDinCapil'])->group(function () {
        Route::get('/respon/{id}/revisi', [ResponController::class, 'revisi'])->name('ajuan.revisi');
        Route::put('/respon/{id}/revisi', [ResponController::class, 'revisiProses'])->name('ajuan.revisi');
    });
    Route::get('/finalDok/{jenis}/{id}/create', [FinalDokumenController::class, 'create'])->name('finalDokumen.create');
    Route::post('/finalDok', [FinalDokumenController::class, 'store'])->name('finalDokumen.store');
    Route::get('/finalDok/{jenis}/{id}/edit', [FinalDokumenController::class, 'edit'])->name('finalDokumen.edit');
    Route::put('/finalDok/{id}', [FinalDokumenController::class, 'update'])->name('finalDokumen.update');
});
