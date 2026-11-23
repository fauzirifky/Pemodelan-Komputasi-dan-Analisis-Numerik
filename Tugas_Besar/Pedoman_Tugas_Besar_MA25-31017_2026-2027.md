# Pedoman Tugas Besar MA25-31017

**Pemodelan Komputasi dan Analisis Numerik — Semester Ganjil 2026/2027**

## Gagasan utama

Mahasiswa menyelesaikan satu masalah berbasis data ilmiah dengan alur utuh: **memahami masalah → membaca data → memilih model → mengestimasi parameter → menjalankan prosedur numerik → memvalidasi → menginterpretasikan → menulis artikel ilmiah**. Metode numerik adalah alat untuk menjawab masalah, bukan tujuan akhir penelitian.

## 1. CPL yang diukur

- **CPL-6:** menerapkan metode matematis/numerik dengan teknologi terkini, memperoleh solusi, serta menginterpretasikan dan mengevaluasi solusi. Bukti: SPL, estimasi parameter, akar, turunan, integral, ODE, residual, galat, konvergensi, dan benchmark.
- **CPL-7:** menerapkan dan menganalisis model matematika untuk masalah nyata serta mengevaluasi akurasi, keterbatasan, dan relevansinya. Bukti: formulasi masalah, pemilihan model, hubungan antarprosedur, interpretasi, keterbatasan, dan implikasi.
- **CPL-10:** berpikir kritis, bekerja mandiri/tim, serta beradaptasi dengan ilmu dan teknologi. Bukti: literatur terverifikasi, reproducibility, provenance data/angka, pembagian kontribusi, response to reviewer, AI disclosure, dan ujian individual.

## 2. Komponen numerik wajib

Setiap kelompok wajib mengintegrasikan enam komponen berikut dalam satu studi yang koheren:

1. Sistem Persamaan Linear (SPL)
2. Estimasi parameter
3. Pencarian akar
4. Turunan numerik
5. Integral numerik
6. Penyelesaian ODE/PDB

Keenam komponen **tidak boleh** menjadi enam soal terpisah. Setiap perhitungan harus mempunyai tujuan dan interpretasi terhadap masalah.

## 3. Aturan pemilihan masalah dan model RA–RB

Pemilihan dilakukan dari **masalah terlebih dahulu**, baru model yang kompatibel.

1. Satu masalah maksimal dipilih oleh **satu kelompok RA** dan **satu kelompok RB**.
2. Masalah yang sama boleh muncul sekali di RA dan sekali di RB, tetapi **model wajib berbeda**.
3. Pasangan **masalah + model** tidak boleh sama pada dua kelompok mana pun.
4. Model boleh digunakan pada beberapa masalah yang berbeda apabila struktur matematis dan interpretasinya relevan.
5. Data utama mengikuti Problem ID dan telah disediakan sebagai CSV siap pakai.

Google Sheet pemilihan: https://docs.google.com/spreadsheets/d/1Z7TFpH8m0AEoP25FIAwMUMywgLYDUVBBlKkQOVzgSJI/edit

## 4. Daftar masalah dan data siap pakai

| ID | Masalah | Data | Model kompatibel |
|---|---|---|---|
| P01 | Pertumbuhan bobot sapi Brahman | [P01_brahman_cattle.csv](data/P01_brahman_cattle.csv) | Brody; von Bertalanffy; Gompertz growth |
| P02 | Pertumbuhan tumor | [P02_tumor_growth.csv](data/P02_tumor_growth.csv) | Logistic growth; Gompertz growth; von Bertalanffy-type |
| P03 | Farmakokinetik Theophylline oral | [P03_theophylline.csv](data/P03_theophylline.csv) | Bateman; Bateman + lag time; Mono-exponential |
| P04 | Farmakokinetik Indomethacin IV | [P04_indomethacin.csv](data/P04_indomethacin.csv) | Mono-exponential; Bi-exponential; Two-stage bi-exponential |
| P05 | Degradasi kapasitas baterai NASA B0005 | [P05_nasa_b0005.csv](data/P05_nasa_b0005.csv) | Linear degradation; Quadratic degradation; Offset exponential decay |
| P06 | Wabah influenza boarding school 1978 | [P06_influenza_boarding_school.csv](data/P06_influenza_boarding_school.csv) | Gaussian epidemic curve; Gamma-shaped epidemic curve; SIR |
| P07 | Pertumbuhan ikan karang Acanthurus achilles | [P07_coral_reef_fish.csv](data/P07_coral_reef_fish.csv) | von Bertalanffy; Gompertz growth; Logistic growth |
| P08 | Pertumbuhan sel E. coli pada medium Glucose | [P08_microbial_growth.csv](data/P08_microbial_growth.csv) | Logistic growth; Gompertz growth; Weibull growth |
| P09 | Respons barley terhadap salinitas NaCl | [P09_barley_salinity.csv](data/P09_barley_salinity.csv) | Linear inhibition; Exponential inhibition; Hyperbolic inhibition |
| P10 | Perkembangan akar Arabidopsis thaliana | [P10_arabidopsis_root.csv](data/P10_arabidopsis_root.csv) | Logistic growth; Gompertz growth; Weibull growth |
| P11 | Dinamika wolf–moose Isle Royale | [P11_wolf_moose.csv](data/P11_wolf_moose.csv) | Prey-only logistic; Moose logistic + wolf forcing; Lotka–Volterra |

Semua file adalah **entry point** project dan bukan data sintetis. Beberapa merupakan subset atau transformasi terukur dari dataset publik. Detail provenance terdapat pada [`data/DATA_SOURCES.md`](data/DATA_SOURCES.md).

Catatan khusus:
- **P06:** `in_bed_infectious_proxy` digunakan sebagai proxy infeksi aktif; `convalescent` bukan recovered kumulatif.
- **P08:** `relative_time_index` adalah indeks pedagogis 0–1 berdasarkan urutan observasi sumber, bukan waktu eksperimen terukur.
- **P09:** default analisis memakai `root_length_cm` untuk Control/NaCl pada EC 0, 5, dan 10; karena titik sedikit, model sengaja sederhana.

## 5. Katalog model

Model dipisahkan dari masalah agar terlihat bahwa model tertentu dapat dipakai lintas fenomena.

| Model | Bentuk/struktur | p | Level | Problem ID |
|---|---|---:|---|---|
| Brody | `W(t)=A(1-Be^{-kt})` | 3 | Sedang | P01 |
| von Bertalanffy | `L(t)=L_\infty(1-e^{-K(t-t_0)})` | 3 | Sedang | P01;P07 |
| von Bertalanffy-type | `V(t)=K(1-Be^{-rt})^3` | 3 | Sedang | P02 |
| Logistic growth | `y(t)=K/[1+e^{-r(t-t_0)}]` | 3 | Ringan | P02;P07;P08;P10 |
| Gompertz growth | `y(t)=K\exp[-\exp(-r(t-t_0))]` | 3 | Ringan | P01;P02;P07;P08;P10 |
| Weibull growth | `y(t)=K[1-\exp(-(t/\lambda)^m)]` | 3 | Sedang | P08;P10 |
| Bateman | `C(t)=A(e^{-k_e t}-e^{-k_a t})` | 3 | Sedang | P03 |
| Bateman + lag time | `C(t)=A[e^{-k_e(t-t_l)}-e^{-k_a(t-t_l)}]` | 4 | Sedang | P03 |
| Mono-exponential | `y(t)=A e^{-kt}` | 2 | Ringan | P03;P04 |
| Bi-exponential | `C(t)=A e^{-\alpha t}+B e^{-\beta t}` | 4 | Sedang | P04 |
| Two-stage bi-exponential | `C(t)=A e^{-\alpha t}+B e^{-\beta t}` | 3 | Sedang | P04 |
| Linear degradation | `Q(n)=a+bn` | 2 | Ringan | P05 |
| Quadratic degradation | `Q(n)=a+bn+cn^2` | 3 | Ringan | P05 |
| Offset exponential decay | `Q(n)=C+A e^{-kn}` | 3 | Sedang | P05 |
| Gaussian epidemic curve | `I(t)=A\exp[-(t-\mu)^2/(2\sigma^2)]` | 3 | Ringan | P06 |
| Gamma-shaped epidemic curve | `I(t)=A t^p e^{-kt}` | 3 | Ringan | P06 |
| SIR | `S'=-\beta SI/N,\ I'=\beta SI/N-\gamma I,\ R'=\gamma I` | 2 | Sedang | P06 |
| Linear inhibition | `y(x)=A(1-kx)` | 2 | Ringan | P09 |
| Exponential inhibition | `y(x)=A e^{-kx}` | 2 | Ringan | P09 |
| Hyperbolic inhibition | `y(x)=A/(1+kx)` | 2 | Ringan | P09 |
| Prey-only logistic | `M'=rM(1-M/K)` | 2 | Ringan | P11 |
| Moose logistic + wolf forcing | `M'=rM(1-M/K)-aW(t)M` | 3 | Sedang | P11 |
| Lotka–Volterra | `M'=aM-bMW,\ W'=cMW-dW` | 4 | Sedang | P11 |

`p` = jumlah parameter utama yang diestimasi pada versi project. Label Ringan/Sedang hanya menunjukkan beban pemodelan relatif; **rubrik dan komponen numerik tetap sama**.

Contoh model reusable:
- Logistic growth: P02, P07, P08, P10.
- Gompertz growth: P01, P02, P07, P08, P10.
- Mono-exponential: P03 dan P04.

## 6. Estimasi parameter dan SPL

Definisikan residual:

`r_i(theta) = y_i - m(x_i; theta)`

Untuk Gauss–Newton, setiap iterasi membentuk:

`(J^T J) Delta theta = J^T r`

`theta_(k+1) = theta_k + Delta theta`

Kelompok wajib membentuk/menjelaskan Jacobian, menyelesaikan SPL dengan prosedur yang dipelajari, menyimpan perubahan parameter dan error, menentukan kriteria berhenti, serta melaporkan RMSE, R², dan residual. MATLAB built-in seperti `A\b` atau `fminsearch` boleh digunakan sebagai **benchmark**, bukan satu-satunya implementasi.

## 7. Pencarian akar

Bentuk persamaan `F(x)=0` yang mempunyai makna terhadap kasus, misalnya threshold konsentrasi, 80% capacity, atau fraksi ukuran dewasa. Gunakan minimal satu metode bracketing dan satu metode terbuka. Bandingkan nilai akar, residual, jumlah iterasi, pola konvergensi, dan pengaruh interval/tebakan awal. `fzero` boleh digunakan sebagai benchmark.

## 8. Turunan numerik

Gunakan beda maju, mundur, dan pusat untuk sedikitnya tiga nilai `h`. Jika turunan analitik tersedia, gunakan sebagai benchmark. Turunan harus diinterpretasikan sebagai **laju perubahan fenomena**, bukan sekadar nilai numerik.

## 9. Integral numerik

Gunakan minimal Trapesium komposit dan Simpson 1/3 komposit serta grid refinement. Integral harus mempunyai makna, misalnya AUC, tumor burden, infectious-person-days, total weight gain, cumulative inhibition, atau capacity loss.

## 10. ODE/PDB

Gunakan Euler, Heun, dan RK4 untuk sedikitnya tiga nilai `h`. Bandingkan dengan solusi eksplisit, fitted model, atau `ode45`. Analisis minimal: galat maksimum, perubahan galat saat `h` diperkecil, stability, dan konsistensi solusi.

Mahasiswa harus mampu membedakan: **error numerik ≠ ketidakcocokan model ≠ noise/variasi data**.

## 11. Visualisasi minimum

1. Data dan fitted model
2. Residual fitting
3. Perubahan error/parameter selama estimasi
4. Fungsi dan lokasi akar
5. Residual root-finding terhadap iterasi
6. Fungsi dan turunan numerik
7. Konvergensi integral terhadap grid/`h`
8. Solusi Euler–Heun–RK4
9. Galat ODE terhadap `h`
10. Visualisasi tambahan yang relevan

Semua sumbu harus memiliki nama dan satuan.

## 12. Luaran utama: artikel ilmiah

Judul berorientasi pada **masalah, objek, dan tujuan/implikasi**, bukan daftar metode. Struktur minimum: Judul, Abstrak, Pendahuluan, Metode, Hasil dan Pembahasan, Kesimpulan, Referensi. Metode harus cukup rinci agar studi dapat direproduksi dan wajib memuat flowchart penelitian.

## 13. Literatur dan bukti sitasi

- Minimal **20 artikel jurnal ilmiah**.
- Minimal **16 dari 20** artikel berada pada rentang 2017–2026.
- Artikel lama diperbolehkan untuk teori/model seminal.
- Seluruh PDF jurnal dikumpulkan.
- Bagian yang benar-benar dipakai dalam manuskrip wajib di-highlight.

Audit yang harus mungkin dilakukan: **klaim manuskrip → sitasi → PDF → highlight sumber**.

## 14. Provenance data, angka, dan kode

Raw/starting data tidak boleh diedit manual. Semua preprocessing harus melalui script. Setiap angka penting harus dapat ditelusuri: **manuskrip ↔ output ↔ kode ↔ data/sumber**.

Kelompok wajib mempunyai Numerical Result Provenance Table dan Code Traceability Table.

## 15. Penggunaan AI

AI diperbolehkan untuk brainstorming, kata kunci literatur, memahami konsep, eksplorasi model, derivasi awal, skeleton kode, debugging/refactoring, visualisasi, benchmark, feedback draft, dan language editing.

AI tidak boleh menjadi sumber data, sumber angka final, sumber referensi tanpa verifikasi, pembuat data/hasil palsu, pembuat sitasi palsu, pengganti pembacaan jurnal, pengganti validasi, atau pengganti keputusan ilmiah mahasiswa.

**AI Disclosure wajib** memuat: alat AI, tujuan, ringkasan prompt, output yang digunakan, dan cara verifikasi. AI tidak boleh digunakan pada ujian tulis individual.

## 16. Struktur berkas pengumpulan

```text
01_Manuscript/
02_References_Highlighted/
03_Raw_Data/
04_Processed_Data/
05_MATLAB_Code/
06_Output/
07_Response_to_Reviewer/
08_AI_Log/
09_Contribution/
README
```

README menjelaskan sumber data serta urutan menjalankan kode hingga menghasilkan tabel/gambar dalam artikel.

## 17. Review dan timeline

| Tahap | Waktu |
|---|---|
| Draft lengkap / Review 1 | 1–7 Desember 2026 |
| Review dan Revisi 1 | target selesai paling lambat 20 Desember 2026 |
| Revisi final (jika perlu) | sekitar 21 Desember 2026–4 Januari 2027 |
| Ujian tulis individual | setelah artikel final selesai |

Review dilakukan **asynchronous**; tidak ada presentasi akhir. Setiap komentar dijawab dengan pola: **Komentar → Respons → Perubahan → Lokasi perubahan**.

## 18. Ujian tulis individual

Tanpa AI. Soal berasal dari project kelompok masing-masing: iterasi metode, potongan kode, alasan pemilihan model, residual/grafik/parameter, pengaruh `h`/toleransi/tebakan awal, error numerik vs error model, audit AI, provenance angka, dan kontribusi pribadi.

## 19. Rubrik berbasis CPL

| CPL | Bobot | Fokus |
|---|---:|---|
| CPL-6 | 40 | metode numerik, implementasi, galat, benchmark |
| CPL-7 | 35 | formulasi masalah, model, interpretasi, keterbatasan |
| CPL-10 | 25 | literatur, provenance, reproducibility, reviewer, AI, teamwork |

Bobot tahap project:

| Tahap | Bobot |
|---|---:|
| Draft lengkap / Review 1 | 20% |
| Revisi 1 + Response to Reviewer | 25% |
| Artikel final + reproducibility package | 35% |
| Ujian tulis individual | 20% |

## 20. Checklist sebelum pengumpulan

- Artikel lengkap, bukan outline.
- Minimal 20 artikel; minimal 16 terbit 2017–2026.
- PDF referensi tersedia dan bagian yang disitasi di-highlight.
- Data dan provenance tersedia.
- Semua preprocessing melalui kode.
- SPL, estimasi, akar, turunan, integral, Euler, Heun, RK4 dikerjakan dan dianalisis.
- Benchmark serta analisis galat/konvergensi tersedia.
- Semua grafik/tabel dapat direproduksi.
- Flowchart penelitian, code traceability, AI disclosure, contribution statement, dan README tersedia.
- Semua anggota siap diuji dari draft, data, dan kode kelompok.

## Prinsip akhir

AI harus membantu mahasiswa bekerja lebih cepat dan mengeksplorasi lebih luas, tetapi keberhasilan project tetap ditentukan oleh kemampuan untuk **memahami → memformulasikan → menghitung → memverifikasi → menginterpretasikan → mengkritisi → mengkomunikasikan**.