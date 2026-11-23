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
* Transkrip riwayat percakapan dan *log prompting* proses pengerjaan Tugas 7 didokumentasikan secara lengkap dan transparan pada berkas [AI_CHAT_LOG_WEEK7.md](AI_CHAT_LOG_WEEK7.md).

---

### Tugas 8

1. **Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.**

   Widget `Navigator` pada Flutter mengurus routing page menggunakan struktur seperti stack:
   * **`Navigator.push()`**: Menambahkan *route* baru ke bagian paling atas *stack* tanpa menghapus *route* yang sedang aktif di bawahnya. Pengguna tetap memiliki riwayat halaman sebelumnya di dalam tumpukan sehingga dapat kembali menggunakan tombol *Back* bawaan aplikasi, sistem perangkat, atau peramban.
   * **`Navigator.pushReplacement()`**: Menghapus *route* yang sedang aktif di posisi paling atas *stack* dan langsung menggantikannya dengan *route* baru. Halaman sebelumnya tidak lagi tersimpan di atas tumpukan pada transisi tersebut, sehingga menekan tombol *Back* tidak akan mengembalikan pengguna ke halaman yang baru saja digantikan.
   * **`Navigator.pop()`**: Menghapus *route* yang sedang berada di posisi paling atas *stack*, sehingga aplikasi menampilkan kembali *route* yang berada tepat di bawahnya. Pada proyek ini, `Navigator.pop()` juga digunakan untuk menutup jendela pop-up `AlertDialog` saat tombol **OK**, **Batal**, atau **Keluar** ditekan.

   **Metode pada Kartu Aksi & Opsi Home pada Drawer:**
   * Untuk membuka halaman formulir dari kartu aksi (**Tambah Experience** dan **Tambah Education** pada `ItemCard` di `lib/widgets/experience_card.dart`), metode yang digunakan adalah **`Navigator.push()`**. Pemilihan `push()` memastikan halaman utama (`MyHomePage`) tetap tersimpan di bagian bawah *stack*, sehingga tombol *Back* otomatis muncul pada `AppBar` formulir dan pengguna dapat kembali ke halaman utama dengan mudah.
   * Sementara itu, opsi **Home** pada `LeftDrawer` (`lib/widgets/left_drawer.dart`) menggunakan metode **`Navigator.pushReplacement()`** menuju `MyHomePage()`. Ketika pengguna sedang berada di halaman `EducationFormPage` atau `ExperienceFormPage` lalu memilih **Home** melalui *drawer*, `pushReplacement()` akan menggantikan *route* halaman formulir di puncak *stack* dengan `MyHomePage()`, sehingga pengguna langsung kembali ke halaman utama tanpa menumpuk duplikat halaman di dalam *navigation stack*.

2. **Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**

   * **Konsistensi Struktur melalui `Scaffold`, `AppBar`, dan `Drawer`**:
     * `Scaffold` berfungsi sebagai kerangka tata letak standar Material Design di setiap halaman (`MyHomePage`, `ExperienceFormPage`, dan `EducationFormPage`) yang menyediakan slot penempatan baku untuk bilah atas (`appBar`), panel navigasi samping (`drawer`), dan konten utama (`body`).
     * `AppBar` memberikan identitas halaman yang seragam di bagian atas layar, menampilkan judul halaman saat ini, tombol *hamburger menu* pembuka *drawer*, atau tombol *Back* secara otomatis sesuai kondisi *navigation stack*.
     * `Drawer` yang diekstraksi menjadi widget modular `LeftDrawer` (`lib/widgets/left_drawer.dart`) dipakai ulang (*reusable*) di seluruh halaman aplikasi. Dengan menyematkan `drawer: const LeftDrawer()` pada setiap `Scaffold`, pengguna mendapatkan pengalaman navigasi yang konsisten untuk berpindah ke **Home**, **Add Experience**, maupun **Add Education** dari layar mana pun tanpa duplikasi kode.
   * **Contoh Penggunaan Warna Tema di Lebih dari Satu Halaman**:
     Pada `lib/main.dart`, tema aplikasinya memakai `ColorScheme.fromSeed(seedColor: const Color(0xFF7C3AED))`. Warna primer dari tema tersebut (`Theme.of(context).colorScheme.primary`) digunakan secara konsisten di berbagai halaman dan komponen, yaitu sebagai `backgroundColor` pada `AppBar` di `MyHomePage` (`lib/screens/menu.dart`), `ExperienceFormPage` (`lib/screens/experience_form.dart`), dan `EducationFormPage` (`lib/screens/education_form.dart`), sebagai warna latar `DrawerHeader` pada `LeftDrawer` (`lib/widgets/left_drawer.dart`), serta sebagai warna latar tombol `ElevatedButton` (**Save** / **Simpan**) pada kedua halaman formulir.

3. **Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.**

   * **Alasan Pemilihan Tata Letak Formulir**:
     Halaman formulir (`ExperienceFormPage` dan `EducationFormPage`) menggunakan susunan vertikal berbasis `Column` dengan `crossAxisAlignment: CrossAxisAlignment.start`. Alur tampilannya dari atas ke bawah (mulai dari *Institusi*, *Gelar / Jurusan*, *IPK / GPA*, *Tanggal Mulai*, switch status *Masih menempuh pendidikan ini*, *Tanggal Selesai*, hingga tombol *Simpan*).
   * **Peran Widget Pengatur Jarak (`Padding` & `SizedBox`)**:
     Setiap komponen input di dalam formulir dibungkus dengan `Padding(padding: const EdgeInsets.all(8.0))` (atau `EdgeInsets.symmetric(horizontal: 8.0)` pada `SwitchListTile`). Widget `Padding` dan `SizedBox` memastikan adanya ruang bernapas (*whitespace*) yang konsisten antar-elemen dan mencegah bingkai `OutlineInputBorder` menempel langsung ke tepi layar atau saling berhimpitan, sehingga menurunkan risiko salah klik pada layar sentuh yang sempit.
   * **Peran Widget Penggulir (`SingleChildScrollView`) saat Ruang Layar Terbatas**:
     Widget `Column` secara bawaan tidak dapat digulir (*non-scrollable*) dan akan memicu galat *RenderFlex bottom overflowed* apabila tinggi total seluruh anak widget melebihi ruang vertikal layar, terutama saat layar diputar ke orientasi lanskap, dibuka pada jendela yang pendek, atau saat papan ketik virtual (*on-screen keyboard*) muncul dan mengambil hampir separuh tinggi layar. Dengan membungkus `Column` di dalam `SingleChildScrollView` (baik pada halaman formulir, halaman utama `menu.dart`, maupun di dalam konten `AlertDialog`), seluruh elemen formulir dan tombol **Simpan** tetap dapat digulir dan diakses dengan aman tanpa terpotong.

4. **Apa peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**

   * **Peran `GlobalKey<FormState>`, `validator`, dan `validate()`**:
     * `GlobalKey<FormState>` (`_formKey`) bertindak sebagai pengenal unik sekaligus pemegang referensi langsung ke objek `FormState` dari widget `Form` di dalam *widget tree*, sehingga status formulir dapat diakses dan dikendalikan dari dalam fungsi `onPressed` tombol **Simpan**.
     * `validator` adalah fungsi *callback* pada masing-masing `FormField` (seperti `TextFormField`) yang memeriksa nilai input field tersebut: mengembalikan `String` berisi pesan kesalahan apabila input melanggar aturan, atau mengembalikan `null` apabila input dinyatakan valid.
     * `validate()` (dipanggil melalui `_formKey.currentState!.validate()`) adalah metode yang mengeksekusi fungsi `validator` pada seluruh field di dalam `Form` secara serentak. Jika ada satu saja field yang mengembalikan pesan error, `validate()` akan menampilkan teks kesalahan di bawah field terkait dan mengembalikan `false` (sehingga penyimpanan/dialog dibatalkan); jika seluruh field mengembalikan `null`, `validate()` mengembalikan `true` dan aplikasi menampilkan `AlertDialog` ringkasan data (diikuti pemanggilan `_formKey.currentState!.reset()` saat dialog ditutup).
   * **Contoh Nilai yang Ditolak oleh Validasi**:
     Pada `EducationFormPage` (`lib/screens/education_form.dart`), beberapa contoh nilai yang ditolak antara lain:
     1. Nilai **IPK / GPA** sebesar `"4.50"`, `"-1.0"`, `"3.855"`, atau `"abc"` (ditolak karena validasi mewajibkan angka desimal valid pada rentang `0.00` hingga `4.00` dengan maksimal 2 angka di belakang koma).
     2. Nilai **Institusi** atau **Gelar / Jurusan** yang hanya berisi spasi `"   "` (ditolak oleh pengecekan `value.trim().isEmpty`) atau teks yang melebihi 255 karakter.
     3. Nilai **Tanggal Selesai** `2024-01-01` ketika **Tanggal Mulai** diisi `2025-08-01` (ditolak oleh pengecekan `_endedAt!.isBefore(_startedAt!)`).
   * **Mengapa Memilih Jenis Input atau Papan Ketik Saja Belum Cukup**:
     Mengatur jenis papan ketik seperti `keyboardType: const TextInputType.numberWithOptions(decimal: true)` pada field IPK atau `readOnly: true` pada field tanggal hanya berfungsi sebagai bantuan UI, bukan penjamin integritas data. Meskipun papan ketik numerik sudah ditampilkan, pengguna tetap dapat memasukkan angka di luar ketentuan (misalnya IPK `9.99` atau `4.1234`), menempelkan (*mempaste*) teks non-angka dari *clipboard*, atau mengetik karakter bebas melalui papan ketik fisik pada peramban desktop. Begitu pula pada `showDatePicker()`, pengguna tetap bisa memilih tanggal selesai yang lebih awal daripada tanggal mulai. Oleh karena itu, validasi logika eksplisit di dalam `validator` tetap mutlak diperlukan untuk menjamin kebenaran dan keamanan data sebelum diproses lebih lanjut.

---

## AI Disclosure Week 8

### 1. Tools yang Digunakan
* **Gemini 4 Neon & Gemini 4 Hydrogen (Antigravity)**

### 2. Strategi Prompting
* Menggunakan pendekatan *incremental* (bertahap) per fase pengerjaan: analisis *checklist* Tugas 8 terhadap kondisi repositori pasca-Tutorial 09, perancangan halaman formulir baru (`EducationFormPage`), integrasi navigasi halaman utama dan `LeftDrawer`, pengujian manual, hingga dokumentasi.
* Meminta penjelasan konsep widget baru di luar Tutorial 09 (`showDatePicker()`, `TextEditingController`, `SwitchListTile`, serta interaksi `SingleChildScrollView` dengan `GridView.count`) sebelum menerapkannya agar memahami alur logika kode secara utuh.
* Meminta verifikasi statis (`flutter analyze`) dan review kode manual setelah setiap tahap implementasi selesai.

### 3. Bagian yang Dibantu AI
* Memetakan kebutuhan Tugas 8 terhadap kode yang sudah ada dari Tugas 7 dan Tutorial 09 serta menyelaraskannya dengan model `Education` pada proyek backend Django.
* Membantu mengimplementasikan bagian input tanggal (`showDatePicker()` dan `TextEditingController` beserta `dispose()`), toggle status `SwitchListTile`, helper `_formatDate()`, `_pickDate()`, `_resetForm()`, serta dialog ringkasan pada `lib/screens/education_form.dart`.
* Membantu membungkus `body` pada `lib/screens/menu.dart` menggunakan `SingleChildScrollView` dengan `primary: false` dan `NeverScrollableScrollPhysics()` pada `GridView.count` agar tata letak 2x2 aman dari *overflow* pada layar sempit.
* Membantu menyusun format pesan *commit* (*Conventional Commits*) dan kerangka dokumentasi `README.md`.

### 4. Analisis Kritis & Keputusan/Koreksi Mandiri
* **Penemuan dan Perbaikan Bug Styling `RichText` pada `AlertDialog`**: Pada implementasi awal yang dibuat AI, helper `_buildSummaryRow()` di `lib/screens/education_form.dart` menggunakan `RichText` dengan `DefaultTextStyle.of(context).style`. Karena `context` milik `_EducationFormPageState` berada di atas `Scaffold` (belum memiliki *ancestor* `Material`), saat diuji secara manual di Chrome teks ringkasan pada dialog muncul dengan gaya error bawaan Flutter (merah besar dengan garis bawah kuning ganda). Melalui pengujian manual tersebut, bug langsung teridentifikasi dan diperbaiki dengan mengganti `RichText` menjadi `Text.rich(...)` agar otomatis mewarisi `DefaultTextStyle` milik `AlertDialog`.
* **Penyelarasan Model & Tata Letak Kartu Aksi**: Berdasarkan rekomendasi awal dari AI yang diselaraskan dengan model backend Django, saya memilih menggunakan model `Education` untuk formulir baru, lalu secara mandiri menentukan tata letak `GridView.count` menjadi 2x2 (`crossAxisCount: 2`) untuk 4 kartu aksi agar simetris, serta memastikan tidak menambahkan kartu "Lihat Education" terlebih dahulu karena halaman daftar data belum menjadi cakupan Tugas 8.
* **Fitur Ekstra & Validasi Domain**: Saya menuliskan implementasi awal formulir beserta validasi 3 field teks/numerik (`Institusi` dan `Gelar / Jurusan` maks. 255 karakter, serta `IPK / GPA` 0.00-4.00 maks. 2 desimal) secara mandiri sebelum dilengkapi AI untuk bagian input tanggal dan dialog. Selain itu, setelah meninjau opsi fitur ekstra dari AI, saya memilih menerapkan toggle *"Masih menempuh pendidikan ini"* dengan menonaktifkan kolom *Tanggal Selesai* (`enabled: !_isCurrent`) agar UX tetap konsisten dengan properti `is_current` pada model Django (`ended_at is None`).

### 5. Tautan Log Percakapan & Prompting
* Ringkasan transkrip percakapan dan *log prompting* proses pengerjaan Tugas 8 didokumentasikan pada berkas [AI_CHAT_LOG_WEEK8.md](AI_CHAT_LOG_WEEK8.md).
