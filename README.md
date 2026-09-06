# Pemodelan Komputasi dan Analisis Numerik

Repositori bahan kuliah **MA25-31017 Pemodelan Komputasi dan Analisis Numerik**  
Program Studi Matematika — Institut Teknologi Sumatera.

## Struktur

- `Slide/` — slide LaTeX Beamer per pertemuan.
- `Lembar_Kerja/` — lembar kerja / bank soal praktikum.
- `Modul_Praktikum/` — modul praktikum dan asset pendukung.
- `tools/` — build dan sinkronisasi.
- `.github/workflows/` — build otomatis PDF di GitHub Actions.

## Siklus kerja

```bash
sh tools/status.sh
sh tools/build.sh
sh tools/sync.sh "Pesan commit"
```

`sync.sh` menjalankan:

**pull → build → commit → push**

PDF hasil kompilasi disimpan di folder yang sama dengan source `.tex`.

## Konvensi

- Slide:
  - `Slide/Pertemuan_01/`
  - `Slide/Pertemuan_02/`
  - dst.
- Lembar kerja: satu atau beberapa root `.tex` di `Lembar_Kerja/`.
- Modul praktikum: boleh bertingkat di dalam `Modul_Praktikum/`.
- File `.tex` yang memiliki `\documentclass` dianggap root dan akan dikompilasi otomatis.
