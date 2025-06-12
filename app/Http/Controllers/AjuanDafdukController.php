<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\AjuanDafduk;
use App\Models\OperatorDesa;
use App\Models\OperatorKec;
use App\Models\Layanan;
use Illuminate\Support\Str;
use Carbon\Carbon;

class AjuanDafdukController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $listLayanan = Layanan::where('jenis', 'dafduk')->get();

        if ($user->roleUser === 'operatorDesa') {
            $opdes = OperatorDesa::where('idUser', $user->idUser)->first();
            $ajuan = AjuanDafduk::with('operatorDesa.desa.kecamatan', 'layanan')
                ->whereHas('operatorDesa', function ($query) use ($opdes) {
                    $query->where('idDesa', $opdes->idDesa);
                })
                ->get();
        } elseif ($user->roleUser === 'operatorKecamatan') {
            $opkec = OperatorKec::where('idUser', $user->idUser)->first();
            $ajuan = AjuanDafduk::with('operatorDesa.desa.kecamatan', 'layanan')
                ->whereHas('operatorDesa.desa', function ($query) use ($opkec) {
                    $query->where('idKec', $opkec->idKec);
                })
                ->whereHas('layanan', function ($query) {
                    $query->where('aksesVer', 'kecamatan');
                })
                ->get();
        } elseif ($user->roleUser === 'opDinDafduk') {
            $ajuan = AjuanDafduk::with('operatorDesa.desa.kecamatan', 'layanan')
                ->whereHas('layanan', function ($query) {
                    $query->where('aksesVer', 'dinasDafduk');
                })
                ->get();
        } else {
            // Role lain, ambil semua
            $ajuan = AjuanDafduk::with('operatorDesa.desa.kecamatan', 'layanan')->get();
        }

        return view('ajuanDafduk.index', compact('ajuan', 'listLayanan'));
    }

    public function create()
    {
        $layanan = Layanan::where('jenis', 'dafduk')->get();
        $operatorDesa = OperatorDesa::with('desa.kecamatan', 'user')
            ->where('idUser', Auth::id())
            ->firstOrFail();

        return view('ajuanDafduk.create', compact('layanan', 'operatorDesa'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'idOpdes' => 'required|exists:operatordesa,idOpdes',
            'idLayanan' => 'required|exists:layanan,idLayanan',
            'noKK' => 'required',
            'nik' => 'required',
            'nama' => 'required|string|max:255',
            'keterangan' => 'nullable|string',
            'statAjuan' => 'required|in:dalam proses,ditolak,sudah diproses,revisi',
        ]);

        $data = $request->all();
        $data['token'] = Str::random(6);

        AjuanDafduk::create($data);

        return redirect()->route('ajuanDafduk.index')->with('success', 'Ajuan berhasil ditambahkan.');
    }

    public function edit($id)
    {
        $ajuan = AjuanDafduk::findOrFail($id);
        $layanan = Layanan::where('jenis', 'dafduk')->get();
        $operatorDesa = OperatorDesa::with('desa.kecamatan', 'user')
            ->where('idUser', Auth::id())
            ->firstOrFail();

        return view('ajuanDafduk.edit', compact('ajuan', 'layanan', 'operatorDesa'));
    }

    public function update(Request $request, $id)
    {
        $ajuan = AjuanDafduk::findOrFail($id);

        $request->validate([
            'idLayanan' => 'required|exists:layanan,idLayanan',
            'noKK' => 'required',
            'nik' => 'required',
            'nama' => 'required|string|max:255',
            'keterangan' => 'nullable|string',
        ]);

        $ajuan->update($request->all());

        return redirect()->route('ajuanDafduk.index')->with('success', 'Ajuan berhasil diperbarui.');
    }

    public function destroy($id)
    {
        AjuanDafduk::findOrFail($id)->delete();
        return redirect()->route('ajuanDafduk.index')->with('success', 'Ajuan berhasil dihapus.');
    }

    public function filter(Request $request)
    {
        $user = Auth::user();
        $query = AjuanDafduk::with([
            'layanan',
            'operatorDesa.desa.kecamatan',
            'finalDokumen'
        ]);

        if ($user->roleUser === 'operatorDesa') {
            $opdes = OperatorDesa::where('idUser', $user->idUser)->first();
            $query->whereHas('operatorDesa', function ($q) use ($opdes) {
                $q->where('idDesa', $opdes->idDesa);
            });
        } elseif ($user->roleUser === 'operatorKecamatan') {
            $opkec = OperatorKec::where('idUser', $user->idUser)->first();
            $query->whereHas('operatorDesa.desa', function ($q) use ($opkec) {
                $q->where('idKec', $opkec->idKec);
            })->whereHas('layanan', function ($q) {
                $q->where('aksesVer', 'kecamatan');
            });
        } elseif ($user->roleUser === 'opDinDafduk') {
            $query->whereHas('layanan', function ($q) {
                $q->where('aksesVer', 'dinasDafduk');
            });
        }

        $start = Carbon::parse($request->startDate)->startOfDay();
        $end = Carbon::parse($request->endDate)->endOfDay();
        if ($start && $end) {
            $query->whereBetween('created_at', [$start, $end]);
        }

        if ($request->layanan) {
            $query->where('idLayanan', $request->layanan);
        }

        if ($request->status) {
            $query->where('statAjuan', $request->status);
        }

        $result = $query->orderBy('created_at', 'desc')->get();

        return response()->json([
            'data' => $result
        ]);
    }
}
