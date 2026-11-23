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

<!-- TUGAS_BESAR_MA25_31017_START -->
## Tugas Besar MA25-31017 — Ganjil 2026/2027

Pedoman, data siap pakai, dan katalog masalah/model tersedia di
[`Tugas_Besar/`](Tugas_Besar/README.md).

- [Google Slides — Pedoman Tugas Besar](https://docs.google.com/presentation/d/1FgguVLfeAi8n9fJNU7u6OpYVP1Nux1k83aoSLxt_DC0/edit)
- [Google Sheet — Pemilihan masalah dan model RA/RB](https://docs.google.com/spreadsheets/d/1Z7TFpH8m0AEoP25FIAwMUMywgLYDUVBBlKkQOVzgSJI/edit)
- [Data siap pakai P01–P11](Tugas_Besar/data/README.md)

Pemilihan dilakukan **masalah terlebih dahulu**, kemudian model yang kompatibel.
Satu masalah maksimal satu kelompok di RA dan satu kelompok di RB. Jika RA dan
RB memilih masalah yang sama, modelnya wajib berbeda.
<!-- TUGAS_BESAR_MA25_31017_END -->
