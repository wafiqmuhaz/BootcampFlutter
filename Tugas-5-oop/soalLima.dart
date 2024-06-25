
//SOAL KELIMA - 
// Kelas induk Hewan
class Hewan {
  String nama;
  int umur;

  // Konstruktor untuk menginisialisasi objek Hewan
  Hewan(this.nama, this.umur);

  // Method untuk menampilkan informasi Hewan
  void tampilkanInformasi() {
    print('Nama: $nama');
    print('Umur: $umur tahun');
  }
}

// Kelas anak Kucing yang mewarisi dari kelas Hewan
class Kucing extends Hewan {
  String ras;

  // Konstruktor untuk menginisialisasi objek Kucing
  Kucing(String nama, int umur, this.ras) : super(nama, umur);

  // Method untuk mengeong
  void mengeong() {
    print('$nama sedang mengeong.');
  }

  // Override method tampilkanInformasi untuk menambahkan informasi ras
  @override
  void tampilkanInformasi() {
    super.tampilkanInformasi();
    print('Ras: $ras');
  }
}

void soalkeLima() {
  print("\n\n========= SOAL 5 =========");
  // Membuat objek Hewan
  Hewan hewan1 = Hewan('Peno', 5);
  hewan1.tampilkanInformasi();

  // Membuat objek Kucing
  Kucing kucing1 = Kucing('Kitty', 2, 'Persia');
  kucing1.tampilkanInformasi();
  kucing1.mengeong();
}
