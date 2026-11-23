# Provenance dan Sumber Data

Dokumen ini menjelaskan asal setiap file siap pakai. Tidak ada data sintetis yang dibuat untuk menggantikan observasi asli.

## P01 - Pertumbuhan bobot sapi Brahman
- **File siap pakai:** `P01_brahman_cattle.csv`
- **Sumber:** Crispim et al. (2015), PLoS ONE 10:e0139906
- **Sumber/landing URL:** https://doi.org/10.1371/journal.pone.0139906
- **Catatan:** Enam titik ringkasan populasi (mean, SD, min, max) pada umur 0–24 bulan; bukan data individual.

## P02 - Pertumbuhan tumor
- **File siap pakai:** `P02_tumor_growth.csv`
- **Sumber:** Vaghi et al. (2020), PLoS Computational Biology; Zenodo 3574531
- **Sumber/landing URL:** https://zenodo.org/records/3574531
- **Catatan:** Subjek/animal ID 16; volume tumor longitudinal nyata, 10 observasi.

## P03 - Farmakokinetik Theophylline oral
- **File siap pakai:** `P03_theophylline.csv`
- **Sumber:** R datasets::Theoph / Rdatasets
- **Sumber/landing URL:** https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/Theoph.csv
- **Catatan:** Subjek 1; konsentrasi plasma pada 0–24.37 jam beserta berat dan dosis.

## P04 - Farmakokinetik Indomethacin IV
- **File siap pakai:** `P04_indomethacin.csv`
- **Sumber:** R datasets::Indometh / Rdatasets
- **Sumber/landing URL:** https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/Indometh.csv
- **Catatan:** Subjek 1; konsentrasi plasma 0.25–8 jam.

## P05 - Degradasi kapasitas baterai NASA B0005
- **File siap pakai:** `P05_nasa_b0005.csv`
- **Sumber:** NASA battery degradation B0005; ready subset dari mirror NikNaut/RUL-Predictor
- **Sumber/landing URL:** https://github.com/NikNaut/RUL-Predictor/blob/main/data/batt_data5.csv
- **Catatan:** Subset capacity setiap 10 cycle dari cycle 0–160. Nilai capacity berasal dari data B0005 yang telah diproses.

## P06 - Wabah influenza boarding school 1978
- **File siap pakai:** `P06_influenza_boarding_school.csv`
- **Sumber:** British boarding-school influenza outbreak (1978); R outbreaks dataset
- **Sumber/landing URL:** https://www.rdocumentation.org/packages/outbreaks/topics/influenza_england_1978_school
- **Catatan:** 14 hari observasi; kolom in-bed dipakai sebagai proxy jumlah infeksi aktif. Convalescent bukan kumulatif recovered.

## P07 - Pertumbuhan ikan karang Acanthurus achilles
- **File siap pakai:** `P07_coral_reef_fish.csv`
- **Sumber:** Morat et al. (2020), Scientific Data 7:370
- **Sumber/landing URL:** https://github.com/JWicquart/fish_growth
- **Catatan:** 12 observasi capture-level nyata: umur, panjang total, bobot, lokasi. Data lintas-individu sehingga residual biologis dapat besar.

## P08 - Pertumbuhan sel E. coli pada medium Glucose
- **File siap pakai:** `P08_microbial_growth.csv`
- **Sumber:** BanerjeeLab repository; Taheri-Araghi et al. (2014)
- **Sumber/landing URL:** https://github.com/BanerjeeLab/bacterial_growth_model/blob/main/E_coli.csv
- **Catatan:** 20 nilai mean cell length nyata untuk kondisi Glucose. relative_time_index 0–1 adalah indeks pedagogis berbasis urutan sumber, bukan waktu eksperimen terukur.

## P09 - Respons barley terhadap salinitas NaCl
- **File siap pakai:** `P09_barley_salinity.csv`
- **Sumber:** Kumar et al. (1988), Annals of Arid Zone
- **Sumber/landing URL:** https://epubs.icar.org.in/index.php/AAZ
- **Catatan:** Data nyata untuk Control serta 4 jenis garam pada EC 5 dan 10. Untuk project, default respons = root length pada NaCl (control, 5, 10).

## P10 - Perkembangan akar Arabidopsis thaliana
- **File siap pakai:** `P10_arabidopsis_root.csv`
- **Sumber:** AraPheno; Bouain et al. (2018), PLoS Genetics
- **Sumber/landing URL:** https://doi.org/10.1371/journal.pgen.1007304
- **Catatan:** Aksesion Ri-0, hari 1–7, root length dengan unit yang dilabeli AraPheno sebagai micron pixel.

## P11 - Dinamika wolf–moose Isle Royale
- **File siap pakai:** `P11_wolf_moose.csv`
- **Sumber:** Isle Royale Wolf–Moose project; mirror James-Thorson-NOAA/dsem
- **Sumber/landing URL:** https://github.com/James-Thorson-NOAA/dsem/blob/master/data-raw/Data_wolves_moose_Isle_Royale_June2019--Tab1.csv
- **Catatan:** Subset 1959–1996 berisi year, wolves, moose. Dipilih sebagai rentang kontinu awal untuk project.

## Catatan transformasi yang perlu disebutkan dalam manuskrip

- **P05:** file project adalah subset cycle dari data capacity B0005 yang sudah diproses pada mirror publik; mahasiswa tetap wajib mengutip sumber NASA/rujukan dataset yang sesuai.
- **P07:** file project adalah subset capture-level untuk satu spesies, bukan seluruh dataset back-calculated size-at-age.
- **P08:** `relative_time_index` dibentuk dari urutan 20 observasi sumber pada kondisi Glucose dan diskalakan 0-1. Ini adalah indeks untuk kegiatan komputasi, bukan waktu eksperimen terukur.
- **P09:** file berisi seluruh garam yang tersedia pada tabel sumber, tetapi default project memakai Control/NaCl untuk respons root length.
- **P11:** project memakai subset 1959-1996 dari seri Isle Royale yang lebih panjang.