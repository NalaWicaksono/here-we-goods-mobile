# here_we_goods

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

TUGAS 7
1. Widget tree adalah struktur hierarki yang merepresentasikan susunan widget pada UI. Setiap widget bisa memiliki satu atau lebih child dan mewariskan konteks/layout/tema ke turunannya. Perubahan di level parent dapat memengaruhi child (misalnya `Theme`, `DefaultTextStyle`), dan build berjalan dari parent ke child untuk menyusun UI akhir.

2. MaterialApp: Penyedia konfigurasi global aplikasi seperti tema dan navigator.

Scaffold: Kerangka halaman yang menyediakan app bar, body, dan snackbar.

AppBar: Bilah judul di bagian atas layar.

LayoutBuilder: Mengambil BoxConstraints agar UI bisa responsif.

Row dan ListView: Menata tombol secara horizontal atau vertikal sesuai lebar layar.

ElevatedButton.icon: Tombol dengan ikon dan teks.

SnackBar dan ScaffoldMessenger: Menampilkan pesan umpan balik saat tombol ditekan.

Icon, Text, Center, ConstrainedBox, SizedBox, Semantics: Elemen pendukung untuk tata letak, aksesibilitas, dan tipografi.

3. MaterialApp menyediakan konfigurasi global seperti tema, routing, dan lokalitas sesuai pedoman Material Design. Menjadikannya root memudahkan pemberian konfigurasi yang konsisten ke seluruh subtree.

4. StatelessWidget: Tidak memiliki state yang berubah. UI ditentukan murni oleh input dan konfigurasi awal.

StatefulWidget: Memiliki objek State terpisah yang bisa berubah seiring waktu. Cocok untuk interaksi, form, animasi, atau data dinamis.

5. BuildContext adalah referensi posisi sebuah widget di dalam widget tree. Konteks dipakai untuk mencari ancestor (misalnya Theme.of(context), ScaffoldMessenger.of(context)), melakukan navigasi, dan memberikan batas ruang lingkup dependensi.

6. Hot reload: Menyuntikkan perubahan kode ke VM dan membangun ulang widget tanpa menginisialisasi ulang state (dengan beberapa pengecualian). Cepat untuk iterasi UI.

Hot restart: Menjalankan ulang aplikasi dari awal sehingga seluruh state kembali ke kondisi awal.

Tugas 8

1. push: menumpuk halaman baru di atas stack --> bisa kembali dengan back.
Di app: tombol Create Product dari Home --> push (user bisa kembali ke Home).

pushReplacement: mengganti halaman saat ini --> tidak bisa kembali ke halaman lama.
Di app: navigasi lewat Drawer agar tidak menumpuk halaman atau setelah Save jika ingin menutup form permanen.

2. Scaffold: rangka tiap halaman (punya appBar, drawer, body) --> konsisten di semua page.

AppBar: judul yang jelas per halaman (Home vs Create Product).

Drawer: menu global yang sama di semua halaman (Home, Create Product).
Hasilnya: layout dan navigasi terasa seragam di seluruh aplikasi. 

3. Padding: memberi ruang di sekitar field --> rapi & mudah dibaca.

SingleChildScrollView: form bisa discroll saat layar kecil/keyboard muncul --> tidak overflow.

ListView: menata item vertikal responsif (mis. daftar tombol di Home pada layar sempit).
Contoh singkat: form dibungkus SingleChildScrollView, tiap TextFormField diberi Padding.

4. Set di ThemeData (misalnya seed blue/indigo) dan pakai konsisten untuk AppBar, tombol utama, dan aksen.
Hasilnya: AppBar biru, tombol Save indigo, elemen lain mengikuti palet yang sama → identitas visual konsisten.

---

Tugas 9
1. 
Membuat model Dart membantu menjaga ketepatan tipe dan null-safety ketika membaca/menulis JSON: setiap field punya tipe jelas (mis. `String`, `int`, `bool`), validasi dan transformasi nama field bisa dipusatkan di `fromJson/toJson`, dan perubahan skema backend cukup diperbaiki di satu tempat. Jika langsung memakai `Map<String, dynamic>`, kode rawan salah ketik key, casting runtime error, nilai `null` tak terkontrol, dan proyek jadi lebih sulit dirawat.

2. 
Package `http` adalah klien HTTP dasar untuk GET/POST tanpa pengelolaan sesi; cocok untuk request “stateless”. `CookieRequest` dari `pbp_django_auth` menambahkan manajemen cookie sesi Django dan helper seperti `login()`, `logout()`, serta `postJson()` sehingga autentikasi berbasis session bekerja otomatis di request berikutnya. Jadi, `http` untuk kebutuhan umum, `CookieRequest` untuk endpoint yang membutuhkan login Django.

3. 
Satu instance `CookieRequest` menyimpan cookie sesi yang sama di seluruh halaman, sehingga status login konsisten saat pengguna berpindah layar. Dengan membagikannya via `Provider`, semua widget dapat mengakses sesi tanpa bolak-balik mengoper instance secara manual, dan kita terhindar dari masalah “kehilangan sesi” akibat membuat objek baru.

4. 
Flutter perlu mengarah ke host yang diizinkan Django: di emulator Android, `localhost` harus diakses sebagai `10.0.2.2`, sehingga alamat itu perlu ditambahkan ke `ALLOWED_HOSTS`. Untuk akses lintas origin dan pengiriman cookie sesi, aktifkan CORS serta atur kebijakan SameSite/CSRF yang sesuai. Di Android tambahkan izin internet pada `AndroidManifest.xml`. Jika konfigurasi ini salah, permintaan bisa gagal (network/CORS error), cookie tak terkirim (autentikasi tidak tersimpan), atau Django menolak host (Bad Request/403).

5. 
Pengguna mengisi form di Flutter, lalu data dikirim ke Django (mis. `postJson`). Django memvalidasi dan menyimpan objek, kemudian membalas JSON. Flutter menerima JSON tersebut, memetakannya ke model Dart, memperbarui state (mis. lewat `FutureBuilder`/`setState`), lalu menampilkan daftar atau detail item. Untuk filter “milik saya”, backend bisa memberi penanda pemilik atau menyediakan query `?filter=my`, yang kemudian diolah Flutter saat menampilkan.

6. 
Saat register, Flutter mengirim `username`, `password1`, dan `password2` ke endpoint Django yang membuat akun baru. Untuk login, Flutter memanggil `request.login()`, Django memverifikasi kredensial dan mengembalikan cookie sesi; `CookieRequest` menyimpannya sehingga request berikutnya otomatis terautentikasi. Setelah login sukses, aplikasi menavigasi ke menu utama. Logout memanggil endpoint Django untuk menghapus sesi, `CookieRequest` membersihkan cookie, dan Flutter mengarahkan kembali ke halaman login.

7. 
- Backend jalan (runserver/deploy), set ALLOWED_HOSTS, CORS/CSRF (jika perlu), izin internet Android.
- Provider + CookieRequest di main.dart (root app).
- Buat Login & Register (pakai endpoint /auth/.../), navigasi & snackbar.
- Buat model Dart sesuai skema Django.
- Buat halaman Products List (GET /items/json/), tampilkan name, price, description, thumbnail, category, is_featured.
- Buat Product Detail (tap card → detail; tombol Kembali).
- Filter item milik user (param ?filter=my atau memakai owner_username dari JSON).
- Tambah Logout di Drawer; tombol Home/All Products/ Create Product tetap jalan.