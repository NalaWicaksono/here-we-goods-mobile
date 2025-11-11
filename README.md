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