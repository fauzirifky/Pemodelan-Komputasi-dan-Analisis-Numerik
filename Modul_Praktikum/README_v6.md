# Modul Praktikum MA25-31017 — Patch v6

Basis naskah: modul-5.pdf (60 halaman) pengguna, contoh Jacobian/residual
pada tangkapan layar kelas, dan 12 file `.m` terlampir. Paket mempertahankan
10 praktikum serta Mock-Up UTS/UAS pada naskah dasar; Bab 1-4 disunting dan
praktikum berikutnya diberi pola dokumentasi function/driver konsisten.

## Berkas utama

- `chapters/00_matlab_dasar.tex`: sintaks dan definisi galat sebelum latihan.
- `chapters/01_akar.tex`: Biseksi → Regula Falsi → Titik Tetap → NR → Secant,
  kode kelas hanya dua metode pertama; function/driver terpisah.
- `chapters/02_spl.tex`: skalar sebelum matriks, formula lengkap, dua functions + driver.
- `chapters/03_spnl_curvefit.tex`: Newton multivariabel diturunkan dari Taylor,
  dipisah tegas dari OLS linear dan Gauss–Newton nonlinear; contoh kelas
  `a0(1-exp(-a1*x))`, Jacobian dan residual sesuai gambar, dataset diperluas.
- `matlab/relative_error.m` mengembalikan bilangan desimal, bukan persen.
- `matlab/driver_*.m`: masalah, input, hasil, grafik; `*.m` function numerik
  tidak menghapus workspace dan tidak menyisipkan plot.
- `matlab/heun_ivp.m`: melengkapi butir B7.2 dan UAS.3.

## Koreksi atas kode sumber terlampir

- `regresi_linear.m`: nama fungsi sesuai file; gunakan `X\y` bukan `inv`.
- `regresi_nonlinear.m`: pastikan residual nx1, Jacobian nxp, perhitungan
  `Z\D` dan update teredam; history selalu tersedia sebelum return.
- `jacobi.m` dan `gauss_seidel.m`: vektor kolom konsisten;
  `max(1,abs(xnew))` elemen-per-elemen; history pada kondisi early stop.
- `biseksi_fun.m` dan `regula_fun.m`: input terverifikasi, output dan history;
  beda algoritma hanya formula kandidat xr.
- Error bernama `err`/`errs` adalah rasio DESIMAL; kali 100 hanya jika label `%`.

## Instalasi

Taruh ZIP patch dan `install_patch_modul_praktikum_v6.sh` di `~/Downloads`. Jalankan
`bash ~/Downloads/install_patch_modul_praktikum_v6.sh` (lokal saja, build, tidak push).
Bila hasil diperiksa dan ingin push, jalankan
`bash ~/Downloads/install_patch_modul_praktikum_v6.sh --push` (jika patch sudah dipasang,
idempotent) atau commit hanya modul dengan perintah Git manual.

Installer: tidak hard-reset, tidak abort rebase otomatis, backup keluar dari
repo, menolak Git rebase/merge conflict, berhenti sebelum commit jika LaTeX gagal,
dan tidak pernah force-push. Preview telah dibangun pada lingkungan pembuat;
MATLAB/Octave tidak tersedia sehingga berkas `.m` diverifikasi struktural dan
contoh numeriknya dicek secara independen, bukan diklaim pernah dieksekusi di MATLAB.
