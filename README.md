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
  Digunakan untuk menambahkan rute baru ke tumpukan navigator, yang memungkinkan Kita kembali ke rute sebelumnya.
  Hal ini berguna ketika Kita ingin mempertahankan state rute sebelumnya dan mungkin ingin kembali ke sana, seperti dalam kasus navigasi ke detail sebuah item dari daftar. <br><br>
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
  Menggantikan rute saat ini dengan rute baru di tumpukan navigator, sehingga Kita tidak dapat kembali ke rute sebelumnya.
  Ini berguna ketika Kita tidak ingin pengguna kembali ke halaman sebelumnya, seperti dalam kasus navigasi dari layar splash ke layar home atau setelah proses login selesai.<br><br>
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

* Container: Widget yang serba guna, dapat digunakan untuk mendekorasi, memberi ukuran, padding, margin, dan melakukan transformasi terhadap widget anaknya. Gunakan Container ketika Kita ingin menambahkan style khusus atau batasan pada widget tunggal.

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
   - **Domain Layer**: Inti dari aplikasi Kita. Ini berisi entitas (model data dasar), kasus penggunaan, dan abstraksi dari repositori. Layer ini seharusnya tidak bergantung pada layer lain dan mewakili aturan bisnis aplikasi.
   - **Data Layer**: Bertanggung jawab untuk mengakses data dari berbagai sumber (API, database lokal, dll). Ini termasuk repositori, data source (remote dan local), dan model data yang lebih kompleks yang biasanya mencakup logika serialisasi/deserialisasi.

2. **Dependency Inversion**: Modul tingkat atas tidak boleh bergantung pada modul tingkat bawah. Sebagai gantinya, kedua modul tersebut harus bergantung pada abstraksi. Dalam praktiknya, ini sering berarti bahwa layer data dan domain mendefinisikan interface atau abstraksi yang diimplementasikan di layer data tetapi digunakan di domain.

3. **Penggunaan Kasus Penggunaan**: Di domain layer, Kita mendefinisikan kasus penggunaan yang menggambarkan aksi yang dapat dilakukan dalam aplikasi Kita. Setiap kasus penggunaan mewakili satu tindakan spesifik dan interaksi dengan repositori.

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

<details>
<summary> Tugas 9 PBP </summary>

# Tugas 9

## 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, bisa dilakukan dengan menggunakan `Map<String, dynamic>` untuk menangani data JSON secara langsung. Pengambilan data JSON tanpa model memberika fleksibilitas karena developer tidak perlu mendefinisikan struktur data terlebih dahulu. Hal ini berguna untuk prototyping cepat atau ketika berinteraksi dengan API yang sering berubah. Developer juga tidak perlu menulis kode tambahan untuk serialisasi dan deserialisasi data, yang bisa menghemat waktu pengembangan.

Akan tetapi, jika dibandingkan dengan pembuatan model, membuat model kelas untuk JSON lebih membantu dalam menjaga kode menjadi lebih terorganisir dan mudah dibaca. Selain itu, pembuatan model membuat kode lebih mudah diperbarui. Oleh karena itu, penggunaan tanpa model lebih cocok untuk skenario ketika struktur data tidak tetap.


## 2. Jelaskan fungsi dari `CookieRequest` dan jelaskan mengapa instance `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Fungsi dari `CookieRequest` adalah untuk menyimpan dan mengelola data sesi pengguna, seperti token autentikasi atau preferensi pengguna. Hal ini sangat penting dalam aplikasi yang membutuhkan pemeliharaan sesi pengguna, seperti penggunaan fitur login yang ada dalam aplikasi Sparkle Sphere ini.

Alasan mengapa sebuah instance `CookieRequest` perlu dibagikan ke semua komponen dalam aplikasi adalah untuk menjaga konsistensi sesi pengguna di seluruh aplikasi. Ini memastikan bahwa setiap komponen aplikasi dapat mengakses dan memanfaatkan data sesi yang sama. Misalnya, jika pengguna telah masuk (login), cookie yang memuat token autentikasi harus dapat diakses oleh semua komponen yang memerlukan verifikasi autentikasi, sehingga pengguna tidak perlu masuk berulang kali saat berpindah antar fitur aplikasi.

## 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Mekanisme pengambilan data dari JSON untuk ditampilkan pada aplikasi Flutter melibatkan beberapa langkah penting. Pertama, kita perlu mendefinisikan sebuah model dalam Flutter yang sesuai dengan struktur data JSON yang diharapkan. Model ini adalah kelas Dart dengan properti yang sesuai dengan kunci dalam data JSON. Di dalam kelas ini, kita juga mengimplementasikan metode fromJson dan toJson untuk mengonversi data antara format JSON dan objek Dart.

Setelah model didefinisikan, langkah selanjutnya adalah mengambil data dari web service menggunakan paket http di Flutter. Kita mengirim permintaan HTTP ke endpoint web service dan menerima respons. Respons ini biasanya dalam format JSON, yang kemudian kita parse menggunakan metode jsonDecode dari Dart untuk mengubahnya menjadi objek Dart (Map atau List).

Selanjutnya, kita menggunakan metode fromJson dari model yang telah kita buat untuk mengubah data JSON yang telah diparse menjadi objek model Dart. Jika data JSON adalah array, kita akan mengiterasi setiap item dan mengonversi setiap item menjadi instance model.

Untuk menampilkan data di Flutter, kita menggunakan berbagai widget yang disediakan oleh Flutter. Dalam tugas ini, saya menggunakan ListView.builder untuk menampilkan daftar item

## 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Mekanisme autentikasi dari input data akun di Flutter ke proses autentikasi di Django dan kemudian menampilkan menu di Flutter berlangsung dalam beberapa tahap terintegrasi. Pertama, di sisi Flutter, pengguna memasukkan detail akun mereka, seperti username dan password, melalui antarmuka pengguna. Flutter kemudian mengirimkan data ini ke server Django menggunakan permintaan HTTP dengan metode POST dan data dikirim dalam format JSON. Setelah menerima data, Django memprosesnya untuk autentikasi. Proses ini melibatkan pengecekan ke database untuk memastikan bahwa detail akun yang diberikan valid dan sesuai dengan yang ada di database. Jika berhasil, Django akan menghasilkan token yang dikirim kembali ke Flutter sebagai bagian dari respons autentikasi.

Di sisi Flutter, aplikasi menanggapi respons dari Django. Jika autentikasi berhasil, aplikasi menyimpan token untuk sesi pengguna dan mengarahkan mereka ke halaman utama atau dashboard aplikasi. Ini memungkinkan pengguna mengakses fitur-fitur yang tersedia sesuai dengan hak akses mereka. Sebaliknya, jika autentikasi gagal, Flutter akan menampilkan pesan kesalahan dan meminta pengguna untuk mencoba lagi. Setelah pengguna berhasil masuk, mereka dapat melihat dan berinteraksi dengan menu atau fitur aplikasi yang tersedia, yang sekarang diakses dengan keamanan dan verifikasi identitas yang telah dilakukan oleh Django. Proses ini menjamin keamanan dalam transaksi data dan memastikan bahwa hanya pengguna terotentikasi yang dapat mengakses fitur tertentu dalam aplikasi.

## 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
``Scaffold``: Widget ini digunakan sebagai kerangka dasar untuk layout halaman di Flutter. Ini menyediakan struktur dasar seperti appBar, body, dan lainnya.

``AppBar``: Widget ini digunakan untuk menampilkan app bar di bagian atas layar. Di dalamnya, Kita menampilkan judul halaman yang diambil dari data item.

``Form``: Widget ini digunakan untuk membuat formulir yang dapat diisi oleh pengguna. Ini membantu dalam validasi dan pengelolaan data formulir.

``IconButton``: Widget ini digunakan untuk menampilkan tombol ikon di app bar. Dalam kasus ini, Kita menggunakan ikon panah kembali (Icons.arrow_back) yang, ketika ditekan, akan memicu fungsi untuk kembali ke halaman sebelumnya (Navigator.pop(context)).

``Padding``: Widget ini digunakan untuk memberikan padding di sekitar konten lainnya, dalam hal ini di sekitar kolom yang menampilkan detail produk.

``Column``: Widget ini digunakan untuk menata beberapa widget lainnya secara vertikal. Ini digunakan untuk menampilkan informasi detail produk.

``Text``: Widget ini digunakan untuk menampilkan teks di layar. Dalam hal ini, digunakan untuk menampilkan berbagai atribut dari item, seperti nama, jumlah, harga, deskripsi, dan kategori

``TextFormField``: Widget ini digunakan untuk menerima input teks dari pengguna. Setiap TextFormField dikonfigurasi dengan dekorasi, validator, dan fungsi onChanged.

``ElevatedButton``: Widget ini digunakan untuk membuat tombol yang, ketika ditekan, akan menjalankan fungsi yang diberikan. Dalam kasus ini, tombol digunakan untuk mengirim data formulir ke server

``Align``: Widget ini digunakan untuk mengatur posisi widget anaknya, dalam hal ini digunakan untuk menempatkan tombol di bagian bawah

``SingleChildScrollView``: Widget ini memungkinkan pengguna untuk menggulir melalui konten yang mungkin tidak muat di layar

``FutureBuilder``: Widget ini digunakan untuk membangun UI berdasarkan hasil dari Future. Dalam kasus ini, digunakan untuk membangun UI setelah data dari fetchItem() diperoleh

``ListView.builder``: Widget ini digunakan untuk membuat daftar item yang dapat digulir. Ini membangun item daftar secara dinamis berdasarkan data yang diperoleh

``InkWell``: Widget ini digunakan untuk menangani ketukan pada item daftar. Ketika item ditekan, ia akan menavigasi ke DetailProductPage dengan data item yang relevan

``Container``: Widget ini digunakan untuk mengelompokkan dan memberikan margin, padding, dan tata letak lainnya pada item daftar

``SizedBox``: Widget ini digunakan untuk memberikan jarak antar widget dalam Column.

``ShopCard``: Widget ini adalah widget kustom, digunakan untuk menampilkan kartu untuk setiap item dalam grid. Setiap ShopCard mewakili sebuah item dalam aplikasi

``LeftDrawer``: Widget adalah widget kustom, digunakan untuk menampilkan menu drawer di sisi kiri layar.

``Drawer``: Widget ini digunakan untuk membuat menu drawer yang dapat ditarik dari sisi layar. Ini memberikan navigasi tambahan dalam aplikasi

``ListView``: Widget ini digunakan untuk membuat daftar item yang dapat discroll. Dalam konteks ini, digunakan untuk menampilkan item-item dalam drawer.

``ListTile``: Widget ini digunakan untuk membuat item yang dapat diklik di dalam ListView. Dalam hal ini, digunakan untuk membuat item navigasi di drawer

``Icon``: Widget ini digunakan untuk menampilkan ikon di samping teks dalam ListTile

``Material``: Widget ini digunakan sebagai dasar untuk menampilkan komponen UI yang mengikuti Material Design. Di sini, digunakan untuk memberikan warna latar belakang pada kartu


## 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

   **--> Membuat halaman login pada proyek tugas Flutter.**

   Pada checklist ini, langkah pertama yang saya lakukan adalah aplikasi baru bernama authentication di proyek Django saya. Kemudian, saya membuat fungsi login di views.py dan melakukan routing. Setelah itu, saya membuat file baru bernama login.dart di falam folder screens. File tersebut saya isi dengan kode berikut.
   ```
   import 'package:sparkle_sphere/screens/menu.dart';
   import 'package:flutter/material.dart';
   import 'package:pbp_django_auth/pbp_django_auth.dart';
   import 'package:provider/provider.dart';
   
   void main() {
       runApp(const LoginApp());
   }
   
   class LoginApp extends StatelessWidget {
   const LoginApp({super.key});
   
   @override
   Widget build(BuildContext context) {
       return MaterialApp(
           title: 'Login',
           theme: ThemeData(
               primarySwatch: Colors.blue,
       ),
       home: const LoginPage(),
       );
       }
   }
   
   class LoginPage extends StatefulWidget {
       const LoginPage({super.key});
   
       @override
       _LoginPageState createState() => _LoginPageState();
   }
   
   class _LoginPageState extends State<LoginPage> {
       final TextEditingController _usernameController = TextEditingController();
       final TextEditingController _passwordController = TextEditingController();
   
       @override
       Widget build(BuildContext context) {
           final request = context.watch<CookieRequest>();
           return Scaffold(
               appBar: AppBar(
                   title: const Text('Login'),
               ),
               body: Container(
                   padding: const EdgeInsets.all(16.0),
                   child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                           TextField(
                               controller: _usernameController,
                               decoration: const InputDecoration(
                                   labelText: 'Username',
                               ),
                           ),
                           const SizedBox(height: 12.0),
                           TextField(
                               controller: _passwordController,
                               decoration: const InputDecoration(
                                   labelText: 'Password',
                               ),
                               obscureText: true,
                           ),
                           const SizedBox(height: 24.0),
                           ElevatedButton(
                               onPressed: () async {
                                   String username = _usernameController.text;
                                   String password = _passwordController.text;
   
                                   // Cek kredensial
                                   // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                   // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                   // gunakan URL http://10.0.2.2/
                                   final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                   'username': username,
                                   'password': password,
                                   });
                       
                                   if (request.loggedIn) {
                                       String message = response['message'];
                                       String uname = response['username'];
                                       Navigator.pushReplacement(
                                           context,
                                           MaterialPageRoute(builder: (context) => MyHomePage()),
                                       );
                                       ScaffoldMessenger.of(context)
                                           ..hideCurrentSnackBar()
                                           ..showSnackBar(
                                               SnackBar(content: Text("$message Selamat datang, $uname.")));
                                       } else {
                                       showDialog(
                                           context: context,
                                           builder: (context) => AlertDialog(
                                               title: const Text('Login Gagal'),
                                               content:
                                                   Text(response['message']),
                                               actions: [
                                                   TextButton(
                                                       child: const Text('OK'),
                                                       onPressed: () {
                                                           Navigator.pop(context);
                                                       },
                                                   ),
                                               ],
                                           ),
                                       );
                                   }
                               },
                               child: const Text('Login'),
                           ),
                       ],
                   ),
               ),
           );
       }
   }
   ```
   Kemudan, saya mengubah kode pada main.dart menjadi seperti berikut.
   ```
   child: MaterialApp(
    title: 'Flutter App',
    theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
    ),
    home: LoginPage()),
   ```

   **--> Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.**

   Langkah pertama yang saya lakukan adala menginsta package berikut.
   ```
   flutter pub add provider
   flutter pub add pbp_django_auth
   ```

   Kemudian, saya mengubah kode pada main.dart untuk menyediakan cookierequest library.
   ```
   class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Flutter App',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                    useMaterial3: true,
                ),
                home: LoginPage()),
               );
       }
   }
   ```

   **--> Membuat model kustom sesuai dengan proyek aplikasi Django.**

   Pada checklist ini, saya copy data JSON dan paste di Quicktype. Kemudian, saya membuat folder baru di dalam lib dengan nama models. Lalu, membuat file baru bernama ```product.dart``` dan paste kode yang sudah dicopy sebelumnya di file tersebut.

   **--> Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.**

   Pada checklist ini, saya membuat file baru bernama ```list_product.dart``` di dalam folder screens. Kemudian, saya mengisi file tersebut dengan kode berikut.
   ```
   class _ProductPageState extends State<ProductPage> {
     Future<List<Product>> fetchProduct() async {
       var url = Uri.parse('http://127.0.0.1:8000/json/');
       var response = await http.get(
         url,
         headers: {"Content-Type": "application/json"},
       );
   
       // melakukan decode response menjadi bentuk json
       var data = jsonDecode(utf8.decode(response.bodyBytes));
   
       // melakukan konversi data json menjadi object Product
       List<Product> list_product = [];
       for (var d in data) {
         if (d != null) {
           list_product.add(Product.fromJson(d));
         }
       }
       return list_product;
     }
   ```
   Class tersebut berguna untuk memproses daftar produk dari JSON menjadi object Product.

   ```
     Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      // Mengambil data produk saat ini
                      var product = snapshot.data![index];

                      return InkWell(
                        onTap: () {
                          // Navigasi ke halaman detail produk dengan data produk
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(product: product),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.fields.name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text("${product.fields.amount}"),
                              const SizedBox(height: 10),
                              Text("${product.fields.description}"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }
            }));
        }
      }
   ```
   Kode tersebut bertujuan untuk menampilkan name, amount, dan description dari masing-masing item yang ada dalam daftar item.

   **--> Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.**

   Pada checklist ini, saya membuat file baru bernama ```product_detail.dart``` di dalam folder screens. Kemudian, saya mengisi file tersebut dengan kode berikut

   ```
   
   import 'package:flutter/material.dart';
   import 'package:sparkle_sphere/models/product.dart';
   
   class ProductDetailPage extends StatelessWidget {
     final Product product;
   
     const ProductDetailPage({Key? key, required this.product}) : super(key: key);
   
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Text(product.fields.name),
           actions: [
             IconButton(
               icon: Icon(Icons.arrow_back),
               onPressed: () => Navigator.pop(context),
             ),
           ],
         ),
         body: Padding(
           padding: EdgeInsets.all(16),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text("Name: ${product.fields.name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
               SizedBox(height: 10),
               Text("Amount: ${product.fields.amount}"),
               SizedBox(height: 10),
               Text("Description: ${product.fields.description}"),
             ],
           ),
         ),
       );
     }
   }
   ```

</details>