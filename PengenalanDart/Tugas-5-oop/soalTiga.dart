
//SOAL KETIGA - 
class Buku {
  String judul;
  String penulis;
  int tahunTerbit;

  // Konstruktor untuk menginisialisasi objek Buku
  Buku(this.judul, this.penulis, this.tahunTerbit);

  // Method untuk menampilkan informasi buku
  void tampilkanInformasi() {
    print('Judul: $judul');
    print('Penulis: $penulis');
    print('Tahun Terbit: $tahunTerbit');
  }
}

void soalkeTiga() {
  print("\n\n========= SOAL 3 =========");
  // Membuat objek Buku
  Buku buku1 = Buku('Laskar Pelangi', 'Andrea Hirata', 2005);
  Buku buku2 = Buku('Bumi Manusia', 'Pramoedya Ananta Toer', 1980);

  // Menampilkan informasi buku1
  buku1.tampilkanInformasi();

  // Menampilkan informasi buku2
  buku2.tampilkanInformasi();
}