# Data Siap Pakai - Tugas Besar MA25-31017

Folder ini menyediakan **entry point data** untuk setiap masalah project. File bukan data sintetis. Sebagian file merupakan subset atau transformasi terukur dari dataset publik agar langsung dapat digunakan di MATLAB.

| ID | Masalah | File | Catatan |
|---|---|---|---|
| P01 | Pertumbuhan bobot sapi Brahman | [P01_brahman_cattle.csv](P01_brahman_cattle.csv) | Enam titik ringkasan populasi (mean, SD, min, max) pada umur 0–24 bulan; bukan data individual. |
| P02 | Pertumbuhan tumor | [P02_tumor_growth.csv](P02_tumor_growth.csv) | Subjek/animal ID 16; volume tumor longitudinal nyata, 10 observasi. |
| P03 | Farmakokinetik Theophylline oral | [P03_theophylline.csv](P03_theophylline.csv) | Subjek 1; konsentrasi plasma pada 0–24.37 jam beserta berat dan dosis. |
| P04 | Farmakokinetik Indomethacin IV | [P04_indomethacin.csv](P04_indomethacin.csv) | Subjek 1; konsentrasi plasma 0.25–8 jam. |
| P05 | Degradasi kapasitas baterai NASA B0005 | [P05_nasa_b0005.csv](P05_nasa_b0005.csv) | Subset capacity setiap 10 cycle dari cycle 0–160. Nilai capacity berasal dari data B0005 yang telah diproses. |
| P06 | Wabah influenza boarding school 1978 | [P06_influenza_boarding_school.csv](P06_influenza_boarding_school.csv) | 14 hari observasi; kolom in-bed dipakai sebagai proxy jumlah infeksi aktif. Convalescent bukan kumulatif recovered. |
| P07 | Pertumbuhan ikan karang Acanthurus achilles | [P07_coral_reef_fish.csv](P07_coral_reef_fish.csv) | 12 observasi capture-level nyata: umur, panjang total, bobot, lokasi. Data lintas-individu sehingga residual biologis dapat besar. |
| P08 | Pertumbuhan sel E. coli pada medium Glucose | [P08_microbial_growth.csv](P08_microbial_growth.csv) | 20 nilai mean cell length nyata untuk kondisi Glucose. relative_time_index 0–1 adalah indeks pedagogis berbasis urutan sumber, bukan waktu eksperimen terukur. |
| P09 | Respons barley terhadap salinitas NaCl | [P09_barley_salinity.csv](P09_barley_salinity.csv) | Data nyata untuk Control serta 4 jenis garam pada EC 5 dan 10. Untuk project, default respons = root length pada NaCl (control, 5, 10). |
| P10 | Perkembangan akar Arabidopsis thaliana | [P10_arabidopsis_root.csv](P10_arabidopsis_root.csv) | Aksesion Ri-0, hari 1–7, root length dengan unit yang dilabeli AraPheno sebagai micron pixel. |
| P11 | Dinamika wolf–moose Isle Royale | [P11_wolf_moose.csv](P11_wolf_moose.csv) | Subset 1959–1996 berisi year, wolves, moose. Dipilih sebagai rentang kontinu awal untuk project. |

## Aturan penggunaan

1. Simpan file ini sebagai salinan raw/starting data. Jangan mengubah nilai secara manual.
2. Semua filtering, subset lanjutan, normalisasi, atau transformasi harus dilakukan melalui kode.
3. Baca sumber asli pada `DATA_SOURCES.md` sebelum menulis narasi ilmiah.
4. File ini mempermudah memulai project, tetapi tidak menggantikan kewajiban verifikasi sumber dan literatur.