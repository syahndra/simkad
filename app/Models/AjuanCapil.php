<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AjuanCapil extends Model
{
    use HasFactory;

    protected $table = 'ajuanCapil';
    protected $primaryKey = 'idCapil';

    protected $fillable = [
        'idOpdes', 'idLayanan', 'tanggalAjuan', 'noAkta', 'noKK', 'nik', 'nama', 'keterangan', 'statAjuan'
    ];

    public function layanan()
    {
        return $this->belongsTo(Layanan::class, 'idLayanan');
    }

    public function operatorDesa()
    {
        return $this->belongsTo(OperatorDesa::class, 'idOpdes');
    }
}
