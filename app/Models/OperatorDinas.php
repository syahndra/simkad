<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OperatorDinas extends Model
{
    protected $table = 'operatorDinas';
    protected $primaryKey = 'idOpdin';
    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = false;

    protected $fillable = [
        'idUser',
        'bidang',
    ];

    // RELASI
    public function user()
    {
        return $this->belongsTo(User::class, 'idUser', 'idUser');
    }
}
