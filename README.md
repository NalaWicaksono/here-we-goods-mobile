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