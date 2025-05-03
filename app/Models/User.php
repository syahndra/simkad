<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $table = 'users';
    protected $primaryKey = 'idUser';
    protected $fillable = [
        'nama',
        'username',
        'email',
        'password',
        'roleUser',
        'status'
    ];
    public function operatorDinas()
    {
        return $this->hasOne(OperatorDinas::class, 'idUser', 'idUser');
    }

    // protected $hidden = [
    //     'password',
    //     'remember_token',
    // ];

    // protected function casts(): array
    // {
    //     return [
    //         'email_verified_at' => 'datetime',
    //         'password' => 'hashed',
    //     ];
    // }
}
