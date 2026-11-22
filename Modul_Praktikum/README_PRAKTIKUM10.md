# Praktikum 10 - Mock-Up Project Pendulum Teredam

Kasus menggunakan open experimental data dari Damped Pendulum Dataset.

Repository sumber: https://github.com/EnzeXu/Damped_Pendulum_Dataset

File sumber: `cleaned_data/len3_cond2_1.csv`

Kondisi: panjang pendulum 0.426 m, Air + small paper baffle, replicate 1.

File MATLAB yang diperlukan berada di `Modul_Praktikum/matlab/`:
- `driver_terpadu.m`
- `gauss_newton_damped.m`
- `bisection_fun.m`
- `secant_fun.m`
- `numdiff.m`
- `trap_comp.m`
- `simpson_comp.m`
- `euler_ivp.m`
- `heun_ivp.m`
- `rk4_ivp.m`

Data berada di `Modul_Praktikum/data/`.

Untuk menjalankan, buka MATLAB pada folder `Modul_Praktikum/matlab` lalu jalankan `driver_terpadu`.
