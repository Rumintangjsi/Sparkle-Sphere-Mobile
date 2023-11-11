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

<details>
<summary> Tugas 8 PBP </summary>

# Tugas 8

## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
Navigator.push() dan Navigator.pushReplacement() adalah dua metode yang digunakan dalam Flutter untuk navigasi antar halaman. Berikut adalah perbedaan utama antara keduanya:

* **Navigator.push():** <br>
  Digunakan untuk menambahkan rute baru ke tumpukan navigator, yang memungkinkan Anda kembali ke rute sebelumnya.
  Hal ini berguna ketika Anda ingin mempertahankan state rute sebelumnya dan mungkin ingin kembali ke sana, seperti dalam kasus navigasi ke detail sebuah item dari daftar. <br><br>
  Contoh Penggunaan Navigator.push(): <br>
  ```
  // Dalam Flutter, navigasi ke halaman detail.
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DetailPage()),
  );
  ```
  Dalam contoh tersebut, ketika user menavigasi ke DetailPage, halaman sebelumnya tetap ada di tumpukan. Pengguna dapat kembali ke halaman sebelumnya dengan menggunakan tombol back.<br><br>

* **Navigator.pushReplacement():** <br>
  Menggantikan rute saat ini dengan rute baru di tumpukan navigator, sehingga Anda tidak dapat kembali ke rute sebelumnya.
  Ini berguna ketika Anda tidak ingin pengguna kembali ke halaman sebelumnya, seperti dalam kasus navigasi dari layar splash ke layar home atau setelah proses login selesai.<br><br>
  Contoh Penggunaan Navigator.pushReplacement():<br>
  ```
  // Dalam Flutter, navigasi ke Home Page setelah login dan menghapus stack sebelumnya.
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
  ```
  Dalam contoh tersebut, setelah user navigasi ke HomePage, halaman login tidak lagi tersedia. Jika pengguna menekan tombol back, mereka tidak akan kembali ke layar login.

Ringkasnya, Navigator.push() menambahkan halaman baru ke tumpukan, memungkinkan navigasi "mundur", sementara Navigator.pushReplacement() menggantikan halaman saat ini sehingga tidak ada opsi untuk kembali ke halaman yang digantikan.

## 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
Dalam Flutter, widget tata letak digunakan untuk mengatur posisi dan ukuran widget anak lainnya. Berikut adalah penjelasan masing-masing widget tata letak yang umum digunakan di Flutter dan konteks penggunaannya:<br>

* Container: Widget yang serba guna, dapat digunakan untuk mendekorasi, memberi ukuran, padding, margin, dan melakukan transformasi terhadap widget anaknya. Gunakan Container ketika Anda ingin menambahkan style khusus atau batasan pada widget tunggal.

* Column: Mirip dengan Row, tetapi menyusun widget anaknya secara vertikal. Gunakan Column untuk menyusun widget seperti daftar atau formulir yang memanjang ke bawah.

* Padding: Memberikan ruang di sekitar widget anaknya. Padding sering digunakan untuk memberi jarak antara batas widget dengan widget lain atau dengan batas layar.

* Align: Menyelaraskan widget anaknya di dalam dirinya sendiri sesuai dengan alignment yang diberikan. Gunakan Align untuk menempatkan widget anak di lokasi tertentu, seperti tengah, kanan atas, atau kiri bawah.

* ListView: Widget scrollable yang menyusun widget anaknya secara linier. Ideal untuk daftar item yang dapat digulir seperti daftar email atau chat.

* GridView: Widget scrollable yang menyusun widget anaknya dalam format grid dua dimensi. Gunakan GridView untuk menampilkan koleksi item seperti galeri foto atau ikon.

* Wrap: Menyusun widget anaknya dan secara otomatis mengalir ke baris atau kolom berikutnya jika tidak ada ruang cukup. Sangat berguna untuk tag atau chip yang jumlahnya dinamis dan perlu dibungkus ke baris selanjutnya.

## 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Dalam tugas kali ini saya menggunakan `TextFormField`:

1. **TextFormField untuk Nama Item**: Elemen input ini digunakan untuk memungkinkan pengguna memasukkan nama item. TextFormField dipilih karena cocok untuk input teks sederhana. Validator digunakan untuk memastikan bahwa input tidak boleh kosong, menegaskan bahwa setiap item harus memiliki nama untuk identifikasi yang jelas.

2. **TextFormField untuk Jumlah (Amount)**: Elemen ini digunakan untuk memasukkan jumlah item. Jenis inputnya disetel ke TextInputType.number untuk memudahkan pengguna memasukkan angka dan untuk mencegah input non-numerik. Validator juga memastikan bahwa jumlah tidak boleh kosong dan harus berupa angka, yang penting untuk inventarisasi dan manajemen stok.

3. **TextFormField untuk Deskripsi**: Elemen ini digunakan untuk memasukkan deskripsi lebih lanjut tentang item. Deskripsi berguna untuk memberikan informasi tambahan tentang item, seperti detail, spesifikasi, atau instruksi penggunaan. Sama seperti input nama, validator memastikan bahwa deskripsi tidak boleh kosong untuk memastikan informasi yang cukup tentang item tersebut.

Keputusan menggunakan TextFormField untuk ketiga elemen input ini didasarkan pada kebutuhan untuk mengumpulkan informasi teks dari pengguna. TextFormField menyediakan cara yang fleksibel dan mudah digunakan untuk input teks, lengkap dengan fitur validasi bawaan yang memastikan data yang diinputkan pengguna memenuhi kriteria tertentu. Ini penting untuk menjaga konsistensi data dan mencegah kesalahan penggunaan aplikasi.

## 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Penerapan clean architecture dalam pengembangan aplikasi Flutter melibatkan pemisahan kode menjadi lapisan yang berbeda dengan tanggung jawab yang jelas. Clean architecture bertujuan untuk membuat kode yang mudah diuji, dipelihara, dan diperluas. Berikut ini adalah cara penerapan clean architecture pada aplikasi Flutter:

1. **Pembagian Lapisan Aplikasi**: 
   - **Presentation Layer**: Mengandung widget dan logika tampilan. Layer ini bertanggung jawab untuk menampilkan data ke pengguna dan menerima input dari pengguna. Ini sering menggunakan model seperti BLoC (Business Logic Component) atau ViewModel untuk memisahkan logika bisnis dari UI.
   - **Domain Layer**: Inti dari aplikasi Anda. Ini berisi entitas (model data dasar), kasus penggunaan, dan abstraksi dari repositori. Layer ini seharusnya tidak bergantung pada layer lain dan mewakili aturan bisnis aplikasi.
   - **Data Layer**: Bertanggung jawab untuk mengakses data dari berbagai sumber (API, database lokal, dll). Ini termasuk repositori, data source (remote dan local), dan model data yang lebih kompleks yang biasanya mencakup logika serialisasi/deserialisasi.

2. **Dependency Inversion**: Modul tingkat atas tidak boleh bergantung pada modul tingkat bawah. Sebagai gantinya, kedua modul tersebut harus bergantung pada abstraksi. Dalam praktiknya, ini sering berarti bahwa layer data dan domain mendefinisikan interface atau abstraksi yang diimplementasikan di layer data tetapi digunakan di domain.

3. **Penggunaan Kasus Penggunaan**: Di domain layer, Anda mendefinisikan kasus penggunaan yang menggambarkan aksi yang dapat dilakukan dalam aplikasi Anda. Setiap kasus penggunaan mewakili satu tindakan spesifik dan interaksi dengan repositori.

4. **Prinsip Single Responsibility**: Setiap kelas harus memiliki tanggung jawab tunggal dan alasan untuk berubah. Ini membantu dalam memelihara dan menguji kode.

5. **Dependency Injection**: Menggunakan dependency injection (DI) untuk memasok objek yang diperlukan ke kelas daripada membuatnya secara langsung di dalam kelas. Ini meningkatkan fleksibilitas dan memudahkan pengujian.

6. **Testing**: Arsitektur yang bersih memudahkan pengujian unit dan pengujian integrasi. Setiap lapisan bisa diuji secara terpisah. Mocking dan stubbing menjadi lebih mudah dengan adanya abstraksi dan dependency injection.

7. **Modularity**: Membagi aplikasi menjadi modul atau paket yang berbeda berdasarkan fitur atau fungsionalitas dapat membantu dalam mengelola dependensi dan memastikan kode tetap bersih.

Dengan menggunakan clean architecture, pengembangan aplikasi Flutter menjadi lebih terstruktur, mudah untuk diuji, dan mudah untuk dipelihara. Ini juga mempermudah tim untuk bekerja secara kolaboratif pada proyek yang sama, karena struktur yang jelas dan pemisahan tanggung jawab.

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

### Menambahkan Drawer Menu untuk Navigasi di Flutter
Mengintegrasikan drawer menu ke dalam aplikasi Flutter saya akan memudahkan navigasi antarhalaman. Ini adalah menu yang muncul dari sisi layar dan berisi tautan navigasi ke berbagai halaman di aplikasi.

#### Langkah 1: Mempersiapkan Berkas untuk Drawer
* Pertama, saya membuka proyek Flutter yang telah saya kerjakan sebelumnya.
* Di dalam direktori `widgets`, saya membuat berkas baru yang saya beri nama `left_drawer.dart`.
* Kemudian, saya menambahkan kode berikut ke dalam `left_drawer.dart`:

    ```
    import 'package:flutter/material.dart';
    import 'package:sparkle_sphere/screens/menu.dart';
    import 'package:sparkle_sphere/screens/shoplist_form.dart';

    class LeftDrawer extends StatelessWidget {
      const LeftDrawer({super.key});

      @override
      Widget build(BuildContext context) {
        return Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
                child: Text(
                  'Sparkle Sphere',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Halaman Utama'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_shopping_cart),
                title: const Text('Tambahkan Item'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ShopFormPage()),
                  );
                },
              ),
            ],
          ),
        );
      }
    }
    ```

#### Langkah 2: Mengimplementasikan Drawer di Halaman Utama
* Saya mengimpor `left_drawer.dart` ke dalam `menu.dart`.
* Di dalam `MyHomePage`, saya memasukkan `LeftDrawer` ke dalam `Scaffold`:

    ```
    import 'package:flutter/material.dart';
    import 'package:sparkle_sphere/widgets/left_drawer.dart';

    class MyHomePage extends StatelessWidget {
      // Kode lainnya

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sparkle Sphere'),
          ),
          drawer: const LeftDrawer(),
          // Body dari Scaffold
        );
      }
    }
    ```

#### Langkah 3: Menambahkan Form untuk Input Data (ShopFormPage)
* Saya membuat form di `shoplist_form.dart` untuk memasukkan data item.
* Saya menambahkan `TextFormField` untuk nama, jumlah, dan deskripsi item, serta tombol 'Simpan'.

    ```
    import 'package:flutter/material.dart';
    import 'package:sparkle_sphere/widgets/left_drawer.dart';

    class ShopFormPage extends StatefulWidget {
      const ShopFormPage({super.key});

      @override
      State<ShopFormPage> createState() => _ShopFormPageState();
    }

    class _ShopFormPageState extends State<ShopFormPage> {
      final _formKey = GlobalKey<FormState>();
      String _name = "";
      int _amount = 0;
      String _description = "";

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Form Tambahkan Item'),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              // Isi dengan TextFormField untuk _name, _amount, dan _description
            ),
          ),
        );
      }
    }
    ```

#### Langkah 4: Menambahkan Fitur Navigasi pada Tombol di ShopCard
* Saya menambahkan fungsi navigasi pada tombol di `menu.dart`. Saat tombol "Tambahkan Item" ditekan, aplikasi akan berpindah ke `ShopFormPage`.

    ```
    // Kode untuk ShopItem di menu.dart
    onTap: () {
      if (item.name == "Tambahkan Item") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShopFormPage()),
        );
      }
    },
    ```

Dengan mengikuti langkah-langkah ini, saya berhasil menambahkan drawer menu untuk navigasi, membuat halaman form untuk input data, dan menambahkan navigasi pada tombol di aplikasi Flutter saya.
</details>