# MyPortfolio Mobile - Pemrograman Berbasis Platform

| Atribut | Informasi |
| :--- | :--- |
| **Nama** | Azka Nur Jauhar |
| **NPM** | 2506612410 |
| **Kelas** | PBP B |
| **Tautan Repositori** | [https://github.com/Otsukaax/myportofolio_mobile](https://github.com/Otsukaax/myportofolio_mobile) |

---

## Deskripsi Proyek
**MyPortfolio Mobile** adalah aplikasi portofolio pribadi berbasis multiplatform yang dibangun menggunakan *framework* **Flutter** dan bahasa pemrograman **Dart**. Aplikasi ini memperluas ekosistem portofolio pribadi ke ranah perangkat bergerak (*mobile*), melanjutkan fondasi web Django yang telah dikembangkan sebelumnya. Pada tahap awal ini, aplikasi mengimplementasikan konsep dasar antarmuka deklaratif Flutter (*widget tree*), pemisahan modul tata letak, pengelolaan profil pengguna, serta tombol aksi bertema dengan umpan balik interaktif.

---

## Panduan Menjalankan Aplikasi (*Setup Guide*)

### Prasyarat:
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi stable terbaru)
* Dart SDK (sudah terintegrasi dengan Flutter SDK)
* Perangkat target: Android Emulator / Perangkat Android Fisik (dengan USB Debugging) / Google Chrome (untuk web)

### Langkah Instalasi dan Eksekusi:
1. *Clone* repositori ini ke komputer lokal Anda:
   ```bash
   git clone https://github.com/Otsukaax/myportofolio_mobile.git
   ```
2. Masuk ke direktori proyek:
   ```bash
   cd myportofolio_mobile
   ```
3. Unduh semua dependensi paket yang dibutuhkan:
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi pada perangkat yang tersedia:
   * Menjalankan pada Google Chrome:
     ```bash
     flutter run -d chrome
     ```
   * Menjalankan pada emulator/perangkat yang aktif:
     ```bash
     flutter run
     ```

---

### Tugas 7

1. **Jelaskan apa yang dimaksud dengan *widget tree* pada Flutter dan bagaimana hubungan induk-anak (*parent-child*) bekerja antar-*widget*!**
   Pengertian Widget Tree: Widget tree adalah logical representation dari seluruh komponen UI di dalam aplikasi Flutter. Filosofi dasar Flutter yaitu "everything is a widget", yang artinya setiap elemen pada aplikasi, mulai dari elemen visual dasar (Text, Icon), elemen tata letak posisi dan batas (Padding, Row, Column, GridView), hingga elemen lainnya direpresentasikan sebagai node di dalam struktur ini.
   
   Hubungan Induk-Anak: Dalam widget tree, setiap widget memiliki hubungan induk-anak (parent-child) yang hierarchical. Sebuah widget bisa memiliki satu atau lebih widget anak (child), dan widget anak tersebut dapat memiliki anaknya sendiri, yang akhirnya menciptakan struktur pohon. Hubungan ini menentukan bagaimana UI disusun dan bagaimana data di-render di antar widget.

   Contohnya pada proyek ini: `MyApp` $\rightarrow$ `MaterialApp` $\rightarrow$ `MyHomePage` $\rightarrow$ `Scaffold`. Di bagian `body`, widget `Padding` bertindak sebagai induk dari `Column`, yang selanjutnya memiliki dua cabang:
     1. Widget `Row` sebagai induk dari 3 kartu `InfoCard` (NPM, Name, Class).
     2. Widget `GridView` sebagai induk dari 3 kartu `ItemCard`, di mana setiap `ItemCard` menyusun ke bawah: `Material` $\rightarrow$ `InkWell` $\rightarrow$ `Container` $\rightarrow$ `Center` $\rightarrow$ `Column` $\rightarrow$ `Icon` dan `Text`.

2. **Sebutkan semua *widget* yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**
   * **Struktur Aplikasi (*Root & Structure*):**
     * `MaterialApp`: *Root widget* yang bertindak sebagai pembungkus utama aplikasi; menginisialisasi konfigurasi tema global Material 3 (`ThemeData`), judul aplikasi, serta menentukan rute halaman awal (`home`).
     * `Scaffold`: Menyediakan kerangka dasar visual halaman sesuai standar Material Design, yang menjadi wadah utama penempatan `AppBar`, `body` (konten layar), dan penampil notifikasi `SnackBar`.
     * `AppBar`: Bilah navigasi bagian atas (*top app bar*) yang berfungsi menampilkan judul aplikasi ("MyPortfolio") dengan latar warna primer.
   * **Tata Letak & Posisi (*Layout & Positioning*):**
     * `Column`: Menyusun kumpulan widget anak (*children*) secara vertikal dari atas ke bawah dalam satu kolom lurus (digunakan pada susunan utama halaman serta di dalam kartu tombol).
     * `Row`: Menyusun kumpulan widget anak secara horizontal dari kiri ke kanan dalam satu baris sejajar (digunakan untuk menata 3 kartu `InfoCard` secara sejajar).
     * `GridView` (`GridView.count`): Menyusun widget anak ke dalam kisi matriks 2 dimensi dengan pembagian 3 kolom sejajar (`crossAxisCount: 3`) untuk merapikan kartu tombol menu aksi.
     * `Padding`: Memberikan jarak batas ruang kosong (*insets*) di sekeliling widget anak agar konten tidak menempel ke batas tepi layar.
     * `Center`: Memposisikan widget anak tepat di tengah ruang area yang tersedia.
     * `Container`: Wadah serbaguna untuk mengatur tata letak, ukuran dimensi lebar yang proporsional terhadap layar (menggunakan pembagian `MediaQuery`), serta bantalan internal (*internal padding*).
     * `SizedBox`: Memberikan jarak pemisah kosong berukuran tetap (*fixed spacer*) antar-widget, baik secara vertikal maupun horizontal.
   * **Elemen Visual & Konten (*Visual & Content*):**
     * `Text`: Menampilkan teks string ke layar dengan format tipografi tertentu (judul AppBar, label info, teks sambutan, dan label tombol).
     * `Icon`: Menampilkan simbol grafis berbasis vektor dari pustaka Material Icons (`Icons.work`, `Icons.add_circle`, `Icons.logout`).
     * `Card`: Menampilkan komponen kartu Material dengan sudut melengkung dan efek bayangan (*elevation*) halus untuk kartu identitas pengguna.
     * `Material`: Menyediakan kanvas permukaan visual Material Design untuk menerapkan warna latar khusus setiap tombol (`item.color`), batas sudut melengkung (*border radius*), serta media render efek sentuhan.
   * **Interaksi & Umpan Balik (*Interaction & Feedback*):**
     * `InkWell`: Menangkap interaksi sentuhan pengguna melalui fungsi `onTap` sekaligus menghasilkan efek animasi riak sentuhan air (*ink splash / ripple effect*).
     * `SnackBar`: Menampilkan panel pesan notifikasi pop-up ringan yang muncul sebentar di bagian bawah layar untuk memberikan umpan balik interaktif saat tombol ditekan.
     * `AlertDialog`: Menampilkan jendela dialog modal interaktif saat tombol logout ditekan untuk meminta konfirmasi pengguna sebelum keluar aplikasi.
     * `TextButton`: Tombol teks berbasis Material Design tanpa batas tebal yang digunakan di dalam `AlertDialog` untuk opsi aksi *Batal* dan *Keluar*.
   * **Widget Kustom Modular (*Custom Widgets*):**
     * `MyApp`: Widget utama aplikasi yang menginisialisasi `MaterialApp`.
     * `MyHomePage`: Widget halaman utama yang mengintegrasikan informasi pemilik portofolio dan kisi tombol menu portofolio.
     * `InfoCard`: Widget modular (*reusable*) khusus untuk menampilkan pasangan judul (*title*) dan isi (*content*) identitas profil secara seragam.
     * `ItemCard`: Widget kartu tombol interaktif buatan sendiri yang memuat ikon, label teks, warna unik masing-masing item, dan pemicu aksi `SnackBar`.

3. **Apa fungsi dari *widget* `MaterialApp`? Jelaskan mengapa *widget* ini umumnya digunakan sebagai *root widget* pada aplikasi Flutter!**
   Widget `MaterialApp` adalah widget yang berfungsi sebagai fondasi utama dalam membangun aplikasi berbasis sistem desain Google Material Design. Fungsi utamanya adalah menginisialisasi infrastruktur dasar aplikasi, meliputi penentuan halaman awal yang dibuka pengguna (`home`), pengelolaan rute dan transisi antar-layar, penyediaan data dimensi dan orientasi perangkat, penentuan arah tata letak teks, serta penetapan tema visual global (`ThemeData`). Dengan inheritance, konfigurasi tema global yang didefinisikan pada `MaterialApp` juga dapat diakses oleh seluruh widget turunan di bawahnya, memungkinkan komponen anak mengakses data tema tersebut menggunakan perintah `Theme.of(context)`.

   `MaterialApp` umumnya digunakan sebagai *root widget* karena bertindak sebagai penyedia prasyarat infrastruktur (*infrastructure provider*) wajib bagi sebagian besar widget bawaan Flutter. Komponen visual standar seperti `Scaffold`, `AppBar`, `Card`, `InkWell`, hingga pemanggilan notifikasi interaktif `SnackBar` tidak dapat berfungsi secara mandiri dan akan memicu galat (*runtime error*) apabila dipanggil di luar naungan `MaterialApp` karena mereka membutuhkan layanan navigasi, kanvas tata letak Material, serta data tema yang diinisialisasi oleh widget ini. Selain itu, meletakkan `MaterialApp` di puncak hierarki pohon widget memastikan seluruh halaman dan komponen turunan yang dibangun memiliki desain, perilaku, dan UX yang seragam dan terstandarisasi secara terpusat.

4. **Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`! Kapan kita sebaiknya memilih `StatelessWidget` dan kapan harus menggunakan `StatefulWidget`?**
   | Aspek Perbedaan | `StatelessWidget` | `StatefulWidget` |
   | :--- | :--- | :--- |
   | **Keberadaan *State*** | **Tidak memiliki *state* internal.** Komponen tidak dapat mengubah status atau tampilannya sendiri melalui aksi internal. | **Memiliki *state* internal dinamis.** Komponen dapat mengubah deskripsi dan wujud tampilannya sewaktu-waktu selama siklus hidupnya (*lifetime*). |
   | **Mutabilitas Properti** | Bersifat **kekal (*immutable*)**. Semua properti atau variabelnya harus dideklarasikan sebagai `final` sejak masa konstruksi objek. | Bersifat **dinamis (*mutable*)**. Data atau variabel internal dapat diubah sewaktu-waktu di dalam kelas pendamping `State`. |
   | **Mekanisme *Rebuild*** | Hanya akan dibangun ulang apabila **widget induk (*parent*) mengirimkan data atau konfigurasi baru** dari luar pohon widget. | Dapat memperbarui dan membangun ulang tampilannya sendiri secara mandiri dari dalam menggunakan metode **`setState()`**. |
   | **Struktur Kelas** | Terdiri dari **1 kelas tunggal** yang meng-*override* metode `build(BuildContext context)`. | Terdiri dari **2 kelas berpasangan**: kelas turunan `StatefulWidget` (membuat state via `createState()`) dan kelas turunan `State<...>` (mengelola logika dan metode `build`). |
   ---
   ### Kapan Sebaiknya Memilih `StatelessWidget`?
   * **Kondisi Penggunaan:** Dipilih ketika antarmuka bersifat **statis, murni presentasional**, dan hanya bertugas menampilkan data yang sudah pasti tanpa perlu merespons perubahan nilai data internal secara *real-time*.
   * **Karakteristik:** Tampilannya tidak terpengaruh oleh interaksi langsung pengguna di layar tersebut dan sepenuhnya bergantung pada data konfigurasi yang dioper oleh widget induknya.
   * **Contoh Kasus:** Teks judul, ikon, tombol yang hanya memicu aksi eksternal, atau kartu informasi profil.
   * **Penerapan pada Proyek Ini:** Seluruh widget halaman utama (`MyHomePage`, `InfoCard`, dan `ItemCard`) diimplementasikan menggunakan `StatelessWidget` karena variabel identitas (NPM, nama, kelas) serta daftar tombol menu bersifat tetap (`final`). Penekanan tombol hanya memicu `SnackBar` melalui layanan global tanpa perlu mengubah variabel tampilan internal kartu tersebut.
   ---
   ### Kapan Harus Menggunakan `StatefulWidget`?
   * **Kondisi Penggunaan:** Digunakan ketika antarmuka bersifat **dinamis, interaktif**, dan tampilannya harus diperbarui (*re-render*) secara langsung akibat interaksi pengguna, berjalannya waktu, atau penerimaan data asinkronus dari server.
   * **Karakteristik:** Terdapat data lokal (*widget state*) yang nilainya berubah selama aplikasi berjalan, sehingga memerlukan pemanggilan `setState()` untuk menggambar ulang UI dengan data terbaru.
   * **Contoh Kasus:**
     * Formulir isian (*text field*) dengan validasi kesalahan secara langsung (*real-time*).
     * Elemen tombol sakelar (*switch*), kotak centang (*checkbox*), atau radio button yang berubah status saat diketuk.
     * Tampilan yang memuat animasi, pengatur waktu (*timer*), atau indikator putaran unduh (*loading spinner*).
     * Aplikasi penghitung (*counter app*) di mana angka pada layar bertambah setiap kali pengguna menekan tombol.


5. **Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode `build`?**
   
   `BuildContext` adalah objek penanda lokasi atau "alamat" spesifik sebuah widget di dalam struktur hierarki *widget tree*. Keberadaannya sangat penting karena memungkinkan widget mengenali posisinya serta mengakses data atau layanan dari widget leluhur di atasnya (seperti tema global dan ukuran layar).
   
   Di dalam metode `build`, `BuildContext` diterima sebagai parameter wajib (`Widget build(BuildContext context)`) untuk menelusuri pohon widget menggunakan fungsi pembantu `.of(context)`. Pada proyek ini, `context` digunakan untuk mengambil warna primer aplikasi (`Theme.of(context)`), menghitung lebar responsif kartu profil (`MediaQuery.of(context)`), serta memunculkan notifikasi interaktif (`ScaffoldMessenger.of(context)`).

6. **Jelaskan konsep *hot reload* di Flutter dan apa perbedaannya dengan *hot restart*! Kapan kita tidak bisa hanya mengandalkan *hot reload* dan harus melakukan *hot restart* atau *full restart*?**
   * **Hot Reload:** Memuat perubahan kode ke dalam Dart VM dan membangun ulang *widget tree* secara instan dengan **tetap mempertahankan status data aplikasi (*preserving the app state*)**. Fitur ini tidak menjalankan ulang fungsi `main()` maupun metode inisialisasi `initState()`.
   * **Hot Restart:** Memuat perubahan kode ke dalam Dart VM dan memulai ulang aplikasi Flutter dari awal, sehingga **seluruh status data aplikasi akan tereset atau hilang (*losing the app state*)**.
   * **Full Restart:** Memulai ulang aplikasi secara menyeluruh pada level sistem operasi (iOS, Android, atau Web). Proses ini memakan waktu paling lama karena harus mengompilasi ulang kode native (Java/Kotlin/ObjC/Swift) atau me-restart *Dart Development Compiler* pada platform web.
   
   Kita tidak bisa hanya mengandalkan *hot reload* dan harus melakukan:
   1. **Hot Restart:** Ketika kita mengubah kode di dalam fungsi `main()` atau metode `initState()`, atau saat kita ingin mereset variabel status (*state*) yang sedang aktif.
   2. **Full Restart:** Ketika kita memodifikasi konfigurasi atau dependensi pada berkas `pubspec.yaml`, mengubah kode native platform (Android/iOS), atau ketika terjadi galat mendasar yang mengharuskan kita menghentikan dan menjalankan ulang konfigurasi aplikasi (*run configuration*).

---

## AI Disclosure Week 7

### 1. Tools yang Digunakan
* **Gemini 3.8 Flash (Antigravity)**

### 2. Strategi Prompting
* Menggunakan pendekatan interaktif dan inkremental dengan memecah instruksi besar ke dalam tahapan-tahapan kecil yang terisolasi (*atomic*).
* Memanfaatkan AI untuk memetakan *checklist* kebutuhan tugas, memvalidasi kepatuhan kode terhadap aturan linter `flutter analyze`, serta meminta saran konvensi pesan *commit* yang deskriptif (*Conventional Commits*).
* Mengonfirmasi setiap keputusan arsitektural dan rancangan visual sebelum diimplementasikan ke dalam kode.

### 3. Bagian yang Dibantu AI
* Menganalisis perbedaan antara kode fondasi Tutorial 08 dengan kebutuhan Tugas 7.
* Membantu memverifikasi bahwa perubahan kode tidak memicu *warning* atau *issues* pada *static analyzer* Dart/Flutter.
* Membantu menyusun struktur dokumen `README.md` dan format pelaporan tugas.

### 4. Analisis Kritis & Keputusan/Koreksi Mandiri
* **Penyelarasan Model Modul Tombol**: AI awalnya menyarankan penggunaan tombol portofolio umum sesuai modul contoh (*"Lihat Proyek"* dan *"Tambah Proyek"*). Namun, saya secara mandiri memutuskan untuk menyesuaikannya ke modul **"Experience"** (*"Lihat Experience"* dan *"Tambah Experience"*). Hal ini bertujuan menjaga kohesi arsitektural dengan backend Django dari Tutorial 7 yang sudah memiliki endpoint REST API `/api/v1/experiences/`, sehingga aplikasi siap untuk integrasi data di masa mendatang.
* **Kustomisasi Tema & Palet Warna**: Saya secara mandiri menentukan kode warna heksadesimal yang modern dan harmonis (warna ungu `0xFF7C3AED` sebagai warna tema dan tombol *Lihat Experience*, hijau emerald `0xFF10B981` untuk *Tambah Experience*, dan merah `0xFFEF4444` untuk tombol *Logout*), serta menyederhanakan konfigurasi tema di `main.dart` dengan mengandalkan `seedColor` Material 3 tanpa *secondary color* manual yang redundan.
* **Fitur Ekstra Dialog Konfirmasi Logout (Peningkatan UX)**: Untuk memenuhi kriteria nilai 4 pada rubrik fungsionalitas dan mencegah aksi keluar sesi yang tidak disengaja (*accidental click*), saya secara mandiri menambahkan jendela konfirmasi interaktif menggunakan `AlertDialog` dan `TextButton` saat tombol *Logout* ditekan, alih-alih hanya mengandalkan notifikasi SnackBar biasa.

### 5. Tautan Log Percakapan & Prompting
* Transkrip riwayat percakapan dan *log prompting* proses pengerjaan Tugas 7 didokumentasikan secara lengkap dan transparan pada berkas [AI_CHAT_LOG.md](AI_CHAT_LOG.md).
