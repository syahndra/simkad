<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Models\User;
// use App\Models\OperatorDinas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class OperatorDinasController extends Controller
{
    public function index()
    {
        $data = User::whereIn('roleUser', ['opDinCapil', 'opDinDafduk'])->get();
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
            'roleUser' => 'required|in:opDinDafduk,opDinCapil',
        ]);

        $user = User::create([
            'nama' => $request->nama,
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'roleUser' => $request->roleUser,
        ]);

        return redirect()->route('operatorDinas.index')->with('success', 'Operator Dinas berhasil ditambahkan.');
    }

    public function edit($id)
    {
        $opdinas = User::findOrFail($id);
        return view('operatorDinas.edit', compact('opdinas'));
    }

    public function update(Request $request, $id)
    {
        $opdinas = User::findOrFail($id);

        $request->validate([
            'nama' => 'required',
            'username' => 'required|unique:users,username,' . $id . ',idUser',
            'email' => 'required|email|unique:users,email,' . $id . ',idUser',
            'password' => 'nullable|confirmed|min:6',
            'roleUser' => 'required|in:opDinDafduk,opDinCapil',
        ]);

        $opdinas->nama = $request->nama;
        $opdinas->username = $request->username;
        $opdinas->email = $request->email;
        $opdinas->roleUser = $request->roleUser;
        if ($request->filled('password')) {
            $opdinas->password = Hash::make($request->password);
        }
        $opdinas->save();

        return redirect()->route('operatorDinas.index')->with('success', 'Data berhasil diperbarui.');
    }

    public function destroy($id)
    {
        $opdinas = User::findOrFail($id);
        $opdinas->delete();

        return redirect()->route('operatorDinas.index')->with('success', 'Operator Dinas dihapus.');
    }
}
