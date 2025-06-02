<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\OperatorDinas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class OperatorDinasController extends Controller
{
    public function index()
    {
        $data = OperatorDinas::with('user')->get();
        return view('operatorDinas.index', compact('data'));
    }

    public function create()
    {
        return view('operatorDinas.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama' => 'required',
            'username' => 'required|unique:users',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:6',
            'bidang' => 'required|in:dafduk,capil',
        ]);

        $user = User::create([
            'nama' => $request->nama,
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'roleUser' => 'operatorDinas',
        ]);

        OperatorDinas::create([
            'idUser' => $user->idUser,
            'bidang' => $request->bidang,
        ]);

        return redirect()->route('operatorDinas.index')->with('success', 'Operator Dinas berhasil ditambahkan.');
    }

    public function edit($id)
    {
        $opdinas = OperatorDinas::with('user')->findOrFail($id);
        return view('operatorDinas.edit', compact('opdinas'));
    }

    public function update(Request $request, $id)
    {
        $opdinas = OperatorDinas::findOrFail($id);
        $user = $opdinas->user;

        $request->validate([
            'nama' => 'required',
            'username' => 'required|unique:users,username,' . $user->idUser . ',idUser',
            'email' => 'required|email|unique:users,email,' . $user->idUser . ',idUser',
            'password' => 'nullable|confirmed|min:6',
            'bidang' => 'required|in:dafduk,capil',
        ]);

        $user->nama = $request->nama;
        $user->username = $request->username;
        $user->email = $request->email;
        if ($request->filled('password')) {
            $user->password = Hash::make($request->password);
        }
        $user->save();

        $opdinas->bidang = $request->bidang;
        $opdinas->save();

        return redirect()->route('operatorDinas.index')->with('success', 'Data berhasil diperbarui.');
    }

    public function destroy($id)
    {
        $opdinas = OperatorDinas::findOrFail($id);
        $opdinas->delete();
        $opdinas->user->delete();

        return redirect()->route('operatorDinas.index')->with('success', 'Operator Dinas dihapus.');
    }
}
