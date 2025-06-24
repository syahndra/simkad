<?php

namespace App\Jobs;

use App\Mail\PengajuanMasukMail;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Mail;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class KirimEmailPengajuanJob implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    protected $email;
    protected $data;

    public function __construct($email, $data)
    {
        $this->email = $email;
        $this->data = $data;
    }

    public function handle()
    {
        Mail::to($this->email)->send(new PengajuanMasukMail($this->data));
    }
}
