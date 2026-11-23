# AI Conversation Log - Individual Assignment 8

Ringkasan transkrip percakapan antara Mahasiswa (*User*) dan AI Assistant (*Gemini 4 Neon & Gemini 4 Hydrogen / Antigravity*) selama proses pengerjaan Tugas Individu 8: Flutter Navigation, Layouts, Forms, and Input Elements.

---

### Percakapan #1 - Analisis Tugas 8

**Pengguna (23 November 2026, 08:31 WIB):**

> analisislah tugas 8

**AI Assistant:**

Berdasarkan panduan `tugas-8.pdf`, kondisi repositori `myportofolio_mobile` pasca-Tugas 7 dan Tutorial 09, serta model backend Django (`models.py`), berikut analisis kebutuhan Tugas 8:

1. **Kondisi Saat Ini**: Struktur modular sudah tersedia (`lib/main.dart`, `lib/screens/menu.dart`, `lib/screens/experience_form.dart`, `lib/widgets/left_drawer.dart`, `lib/widgets/experience_card.dart`) dengan tema ungu Material 3 (`0xFF7C3AED`).
2. **Pemilihan Model Formulir Baru**: Model `Education` (`institution`, `degree`, `gpa`, `started_at`, `ended_at`) dari backend Django paling direkomendasikan karena kohesif dengan proyek web dan mendukung input teks, desimal, serta tanggal (`showDatePicker()`).
3. **Checklist Teknis**:
   - Membuat halaman formulir baru di `lib/screens/education_form.dart` (`StatefulWidget`, `Form`, `GlobalKey<FormState>`, `Scaffold`, `AppBar` bertema, `LeftDrawer`, dan `SingleChildScrollView`).
   - Menambahkan kartu aksi baru di `lib/screens/menu.dart` dan navigasi `Navigator.push()` di `lib/widgets/experience_card.dart`.
   - Menambahkan opsi `Add Education` di `lib/widgets/left_drawer.dart` dengan `Navigator.pushReplacement()` sambil mempertahankan `Home` dan `Add Experience`.
   - Validasi input lengkap (tolak kosong/spasi, batas panjang 255, IPK `0.00`-`4.00` maks 2 desimal, urutan tanggal) dan ringkasan `AlertDialog` melalui `showDialog()`.
   - Verifikasi `flutter analyze`, pengujian manual, serta pembaruan `README.md` (`### Tugas 8` dan AI Disclosure).

---

### Percakapan #2 - Keputusan Desain & Opsi Fitur Ekstra

**Pengguna (23 November 2026, 08:39 WIB):**

> sip, nanti kayak biasanya aja pake education, terus nanti bikin 2x2 aja jadi cross axisnya 2 aja, terus fitur ekstranya masih mikir.. gimana?

**AI Assistant:**

Pemilihan model `Education` dan grid 2x2 (`crossAxisCount: 2`) sudah tepat. Catatan tambahan: bungkus `body` di `lib/screens/menu.dart` dengan `SingleChildScrollView` agar tidak terjadi *bottom overflow* pada layar ponsel. Untuk fitur ekstra (rubrik nilai 4), beberapa opsi yang relevan tanpa package tambahan:
1. Toggle `SwitchListTile`/`CheckboxListTile` *"Masih menempuh pendidikan ini"* (sinkron dengan properti `is_current` di Django) yang otomatis menonaktifkan dan mengosongkan `ended_at`.
2. Tombol reset / tombol hapus cepat tanggal pada field opsional.
3. Ringkasan `AlertDialog` yang terstruktur dengan label tebal dan status berlangsung.

---

### Percakapan #3 - Panduan Tahap 1 & Cara Kerja `showDatePicker()`

**Pengguna (23 November 2026, 08:45 WIB):**

> okelah ya, tahap 1 ngapain

**AI Assistant:**

Menjelaskan rincian Tahap 1 untuk membuat `lib/screens/education_form.dart`: struktur `StatefulWidget`, variabel state sesuai model `Education`, `TextEditingController` untuk field tanggal + `dispose()`, `Scaffold` + `AppBar` + `LeftDrawer`, 5 field input beserta aturan validasinya, serta tombol Simpan dan `AlertDialog`.

**Pengguna (23 November 2026, 09:06 WIB & 09:12 WIB):**

> eh yang datetime gimana dah
> ha? gapaham, coba cek

**AI Assistant:**

Memeriksa `lib/screens/education_form.dart` yang sudah berisi deklarasi variabel state, lalu menjelaskan alur kerja `DateTime?` bersama `TextEditingController` dan `showDatePicker()`:
- `DateTime?` menyimpan data tanggal untuk validasi perbandingan (`isBefore`), sementara `TextEditingController` menampilkan string tanggal pada `TextFormField` (`readOnly: true`).
- Saat `onTap` dipicu, panggil `await showDatePicker(...)`; jika hasil tidak `null`, simpan ke state melalui `setState()` dan format ke `YYYY-MM-DD`.

---

### Percakapan #4 - Review Form Awal & Penyelesaian `lib/screens/education_form.dart`

**Pengguna (23 November 2026, 10:12 WIB):**

> coba cek yang sekarang, dah kutambahin sebagian di formnya sama validasi2 nya

**AI Assistant:**

Mereview `lib/screens/education_form.dart`: struktur `Scaffold`, `AppBar`, `LeftDrawer`, `Form`, `SingleChildScrollView`, serta 3 input awal (`Institusi`, `Gelar / Jurusan`, `IPK / GPA`) dan seluruh validatornya sudah tepat. Menyebutkan bagian yang tersisa (controller tanggal, `showDatePicker`, `SwitchListTile`, tombol Simpan, dan `AlertDialog`).

**Pengguna (23 November 2026, 10:13 WIB & 10:14 WIB):**

> nah itu semua aku gatau, gaada di tutorial juga kan
> kerjain dong

**AI Assistant:**

Melengkapi `lib/screens/education_form.dart` dengan `_startedAtController`, `_endedAtController`, `dispose()`, `_formatDate()`, `_pickDate()`, `_resetForm()`, `_buildSummaryRow()`, field Tanggal Mulai, `SwitchListTile` *"Masih menempuh pendidikan ini"*, field Tanggal Selesai (dengan tombol clear dan validasi urutan tanggal), serta tombol Simpan dan `AlertDialog`. Menjalankan `flutter analyze` dengan hasil `No issues found!`.

**Pengguna (23 November 2026, 10:18 WIB):**

> [Menanyakan fungsi 5 method helper: `dispose()`, `_formatDate()`, `_pickDate()`, `_resetForm()`, `_buildSummaryRow()`] itu semua ngapain dah

**AI Assistant:**

Menjelaskan peran masing-masing dari kelima method helper tersebut agar struktur dan siklus hidup widget mudah dipahami.

---

### Percakapan #5 - Tahap 2 (Navigasi, Drawer, dan Commit Tahap 1)

**Pengguna (23 November 2026, 10:21 WIB - 10:31 WIB):**

> mantap lah, next tahap 2 ngapain
> eh wait, commit dulu ga si?
> bikinin commit cmd nya dong, sama mau tanya, aku ga bikin lihat education ya?
> okelah, maksudku bikinin git command yang bisa aku tinggal copas nanti ke terminal

**AI Assistant:**

- Menjelaskan perubahan Tahap 2 pada `lib/screens/menu.dart`, `lib/widgets/experience_card.dart`, dan `lib/widgets/left_drawer.dart`.
- Menjelaskan bahwa kartu "Lihat Education" tidak wajib pada Tugas 8 karena halaman list data belum menjadi cakupan tugas, serta menjaga jumlah kartu genap (4) agar grid 2x2 simetris.
- Memberikan saran perintah *commit* Tahap 1 (`feat(form): add EducationFormPage with validation and summary dialog`) untuk dijalankan pengguna secara manual.

---

### Percakapan #6 - Review Tahap 2 & Perbaikan Scroll `lib/screens/menu.dart`

**Pengguna (23 November 2026, 13:04 WIB - 13:09 WIB):**

> maksudnya dah kuubah codenya, dah bener kah?
> itu apa *(menanyakan saran `SingleChildScrollView` dan `NeverScrollableScrollPhysics()`)*
> coba pasangin

**AI Assistant:**

Mereview `lib/screens/menu.dart`, `lib/widgets/experience_card.dart`, dan `lib/widgets/left_drawer.dart`: navigasi kartu (`Navigator.push`) dan drawer (`Navigator.pushReplacement`) sudah sesuai dan `flutter analyze` bersih. Menyarankan serta memasangkan `SingleChildScrollView` pada `body` `lib/screens/menu.dart` dengan `primary: false` dan `NeverScrollableScrollPhysics()` pada `GridView.count` agar tidak terjadi *overflow* di layar pendek.

---

### Percakapan #7 - Pengujian Manual & Perbaikan Bug `RichText` pada `AlertDialog`

**Pengguna (23 November 2026, 13:18 WIB & 13:20 WIB):**

> oiya mending bagian: Coba aktifkan toggle "Masih menempuh pendidikan ini" -> pastikan field Tanggal Selesai nonaktif. fieldnya tetep nyala atau mati?
> eh btw ini ngebug kah? [melampirkan tangkapan layar dialog dengan teks merah bergaris bawah kuning ganda]

**AI Assistant:**

- Mengonfirmasi bahwa menonaktifkan field Tanggal Selesai (`enabled: !_isCurrent`) adalah pilihan UX terbaik agar konsisten dengan properti `is_current` di model Django.
- Mengidentifikasi penyebab bug visual pada `AlertDialog`: `_buildSummaryRow()` menggunakan `RichText` dengan `DefaultTextStyle.of(context).style` yang merujuk pada `context` di luar *ancestor* `Material`. Memperbaikinya menjadi `Text.rich(...)` agar mewarisi `DefaultTextStyle` dari `AlertDialog`, lalu memverifikasi dengan `flutter analyze` (`No issues found!`).

**Pengguna (23 November 2026, 13:24 WIB):**

> nah dah bener [melampirkan tangkapan layar dialog yang sudah normal dan rapi]

**AI Assistant:**

Mengonfirmasi tampilan dialog sudah normal dan memberikan saran dua *commit* terpisah untuk navigasi (`feat(nav)`) dan perbaikan dialog (`fix(form)`).

---

### Percakapan #8 - Dokumentasi `README.md` & AI Disclosure Week 8

**Pengguna (23 November 2026, 13:26 WIB - 13:32 WIB):**

> done, btw, fitur tambahannya enaknya gimana?
> iya juga ya, harusnya aman kan ya, tinggal soal readmenya sama AI docs
> bikinkan bagian week 8 nya, masukin soal dan tempat jawabnya, bikinin ai disclosurenya dan chat lognya ya

**AI Assistant:**

- Mengonfirmasi fitur ekstra yang sudah ada (`SwitchListTile`, tombol hapus tanggal, `AlertDialog` terstruktur, dan validasi berlapis) sudah memadai.
- Memberikan kerangka berpikir dan poin acuan proyek untuk 4 pertanyaan reflektif Tugas 8.
- Menambahkan bagian `### Tugas 8` (daftar soal beserta tempat jawaban) dan `## AI Disclosure Week 8` pada `README.md`, serta mendokumentasikan riwayat percakapan pada `AI_CHAT_LOG_WEEK8.md`.
