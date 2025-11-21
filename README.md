# uts

KARINA NURFADILLA
TIF RP23 CNS A
23552011012

1. Jelaskan perbedaan antara Cubit dan Bloc dalam arsitektur Flutter.
Cubit dan Bloc sebenarnya sama-sama bagian dari arsitektur state management *Bloc pattern*, tapi cara kerjanya beda:
Cubit
* Lebih simpel dan ringan.
* Hanya butuh memanggil fungsi lalu meng-*emit* state baru.
* Tidak punya event.
* Cocok untuk fitur yang tidak terlalu kompleks.
Ibaratnya:
Cubit = “langsung panggil fungsi → keluar state baru.”
Bloc
* Lebih lengkap dan lebih ketat.
* Menggunakan event dan state.
* Alur kerjanya lebih terstruktur: kirim event → Bloc proses → emit state.
* Cocok untuk logika yang rumit.
Ibaratnya:
Bloc = “kirim event → diproses → state baru keluar.”

2. Mengapa penting memisahkan antara model data, logika bisnis, dan UI dalam pengembangan aplikasi Flutter?
Memisahkan model, logika, dan UI itu penting karena:
1. Kode jadi lebih rapi dan mudah dibaca.
   Tidak semua bercampur dalam satu file, jadi gampang nyari kesalahan.
2. Aplikasi lebih mudah dikembangkan.
   Kalau ada bagian yang mau diganti (UI atau logika), tidak merusak bagian lain.
3. Mengurangi bug.
   Karena struktur jelas, risiko salah mengubah fungsi jadi lebih kecil.
4. Mudah untuk di-testing.
   Logika bisnis bisa di-test tanpa membutuhkan UI.
Jadi intinya: lebih rapi, lebih aman, gampang dikembangin, dan gampang di-maintain.

3. Sebutkan dan jelaskan minimal tiga state yang mungkin digunakan dalam CartCubit beserta fungsinya.
Contoh state yang sering dipakai dalam fitur keranjang (Cart):

1. CartLoading
Dipakai ketika aplikasi sedang mengambil data keranjang atau memproses perubahan (misal menambah barang).
Fungsinya: memberi tahu UI bahwa proses sedang berjalan.
2. CartLoaded
State ini muncul ketika data keranjang berhasil dimuat.
Fungsinya: mengirimkan daftar item di keranjang ke UI supaya bisa ditampilkan.
3. CartError
Digunakan ketika terjadi error, misalnya gagal memuat item atau gagal menambah barang ke keranjang.
Fungsinya: memberi tahu UI agar menampilkan pesan error.

CartEmpty → keranjang kosong
CartUpdated → keranjang berhasil diperbarui (misal item ditambah/dikurangi)

penjelasan project
Project ini adalah aplikasi Flutter sederhana untuk melihat produk dan menambahkannya ke keranjang belanja.
 1. Daftar Produk
Pengguna melihat beberapa produk di halaman grid. Setiap produk punya nama, harga, dan gambar.
 2. Tambah ke Keranjang
Ketika tombol “Tambah” ditekan, produk langsung masuk ke keranjang dengan jumlah awal 1.
 3. Ringkasan Keranjang
Di halaman keranjang, pengguna bisa:
Tekan + untuk menambah jumlah item
Tekan – untuk mengurangi jumlah item
Jika jumlah 0 → item otomatis dihapus
 4. Total Otomatis
Total harga dan total jumlah item selalu terupdate otomatis menggunakan Cubit (BLoC).
5. Struktur File Rapi
Project dibagi menjadi beberapa folder:
models → data produk
blocs → pengatur state (CartCubit)
pages → halaman UI
widgets → komponen UI kecil
Struktur ini membuat project mudah dikembangkan.

