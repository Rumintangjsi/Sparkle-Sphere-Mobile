![Sparkle Sphere Header](https://i.pinimg.com/564x/4f/1f/85/4f1f8588100c09ee126be1e66483ade8.jpg)
### Nama: Rumintang Jessica H <br>
### Kelas: PBP A <br> 
### Nama App : Sparkle Sphere 🔮💍
<details>
<summary> Tugas 7 PBP </summary>

# Tugas 7

## 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
* **Stateless Widget** : Stateless widget adalah widget yang tidak memerlukan state mutable. Ini berarti bahwa stateless widget tidak menyimpan data yang akan berubah. Contohnya termasuk ikon, teks, dan tombol yang tidak bergantung pada keadaan tertentu.
* **Stateful Widget** : Stateful widget adalah widget yang mengelola state yang mungkin berubah selama masa hidup widget. Ini bisa sesuatu seperti data yang diambil dari internet, atau status tombol yang bisa ditekan.

| Feature | Stateless Widget | Stateful Widget |
|---------|------------------|-----------------|
| State | Tidak memiliki state | Memiliki state yang dapat berubah |
| Lifecycle | Dibuat sekali | Memiliki siklus hidup yang kompleks |
| When to Use | UI statis seperti teks dan ikon | UI dinamis seperti checkboxes, sliders |
| Performance | Lebih efisien | Memerlukan lebih banyak sumber daya |

## 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
* MaterialApp: Widget ini adalah titik awal aplikasi Flutter yang menggunakan material design. Ia mengatur tema dan navigasi di aplikasi.

* Scaffold: Memberikan struktur dasar untuk tampilan layar dengan app bar, body, dan floating action button.

* AppBar: Menampilkan app bar di atas layar yang biasanya berisi judul dan aksi.

* Text: Menampilkan string teks dengan gaya tertentu di layar.

* SingleChildScrollView: Memberikan kemampuan scroll pada konten yang mungkin melebihi ruang layar.

* Padding: Menambahkan jarak di sekeliling widget anaknya.

* Column: Mengatur anak-anaknya dalam kolom vertikal.

* GridView: Mengatur anak-anaknya dalam grid dua dimensi.

* Icon: Menampilkan ikon dari set ikon material.

* InkWell: Memberikan efek visual ketika disentuh dan bisa digunakan untuk mendeteksi berbagai jenis input pengguna.

* Container: Menyediakan kotak untuk mendekorasi atau mengubah ukuran widget anaknya.

* Center: Menengahkan widget anaknya secara horizontal dan vertikal dalam ruang yang tersedia.

* Material: Mengikuti prinsip desain Material, digunakan untuk memberikan efek visual pada InkWell.

* SnackBar: Widget yang muncul di bagian bawah layar untuk memberikan pesan sementara kepada pengguna.

* ShopItem: Bukan widget, tetapi sebuah kelas yang memodelkan data yang akan digunakan oleh widget.

* ShopCard: Widget yang dibuat khusus yang menampilkan informasi dari objek ShopItem.

* ThemeData: Mengonfigurasi tema umum aplikasi termasuk warna, tipe teks, dan elemen desain lainnya.

* ColorScheme: Menentukan skema warna untuk ThemeData.

## 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
**1. Setup Project**
Saya mulai dengan membuat proyek Flutter baru menggunakan terminal dengan perintah flutter create sparkle_sphere.
Kemudian, saya masuk ke direktori proyek dengan cd sparkle_sphere dan membuka kode sumber dengan editor pilihan saya.
**2. Membuat Model Shop Item**
Saya membuat model ShopItem dan menambahkan properti warna untuk dapat mengkostumisasi
```
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;  // Properti warna baru

  ShopItem(this.name, this.icon, this.color);
}
```
**3. Membuat Stateless Widget**
Karena halaman utama tidak memerlukan state, saya mengubah MyHomePage menjadi StatelessWidget dan menghapus segala state yang tidak diperlukan.
```
class MyHomePage extends StatelessWidget {
  // Constructor remains the same
  // Remove all stateful logic
  @override
  Widget build(BuildContext context) {
    // Scaffold and other UI components
  }
}
```
**4. Menambahkan Data**
Saya menambahkan data produk dalam bentuk List<ShopItem> di atas MyHomePage.
```
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, const Color.fromARGB(255, 236, 147, 176)),
    ShopItem("Tambah Item", Icons.add_shopping_cart, const Color.fromARGB(255, 234, 102, 146)),
    ShopItem("Logout", Icons.logout, Color.fromARGB(255, 220, 80, 127))
];
```
Saya juga mengkostumisasi tiap widget agar memiliki warna yang berbeda
**5. Membangun Tampilan**
Saya membangun tampilan menggunakan `Scaffold` dan `AppBar`, kemudian menambahkan `GridView` untuk menampilkan daftar produk.
dart
```
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Sparkle Sphere Shop'),
    ),
    body: GridView.builder(
      // Configurations for GridView
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ShopCard(items[index]);
      },
    ),
  );
}
```
**6. Membuat ShopCard Widget**
Saya membuat `ShopCard` sebagai `StatelessWidget` yang akan menampilkan `ShopItem`.
dart
```
class ShopCard extends StatelessWidget {
  final ShopItem item;
  const ShopCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Returns a card with InkWell that shows a SnackBar on tap
  }
}
```
**7. Implementasi Interaksi**
Pada `InkWell` di dalam `ShopCard`, saya menambahkan interaksi untuk menampilkan SnackBar ketika card ditekan.
dart
```
InkWell(
  onTap: () {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected ${item.name}')),
    );
  },
  // Additional UI components
),
```
**8. Menjalankan Aplikasi**
Setelah selesai dengan _code_, saya menjalankan aplikasi dengan `flutter run` di terminal untuk melihat hasilnya.

</details>
