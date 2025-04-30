<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kecamatan extends Model
{
    protected $primaryKey = 'id_kecamatan';
    protected $table = "kecamatan";
    protected $fillable = ['nama_kecamatan'];
    public $timestamps = false;
}
