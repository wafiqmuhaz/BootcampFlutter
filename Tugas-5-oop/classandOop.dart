void main(){
  soalSatu();
  soalDua();
  soalTiga();
  soalEmpat();
  soalLima();
}

// SOAL PERTAMA - Enkapsulasi
class Siswa {
  String nama;
  String nip;
  double nilai;

  // Konstruktor untuk menginisialisasi objek Siswa
  Siswa(this.nama, this.nip, this.nilai);

  // Method untuk menampilkan informasi siswa
  void tampilkanInformasi() {
    print('Nama: $nama');
    print('NIP: $nip');
    print('Nilai: $nilai');
  }

  // Method untuk menentukan apakah siswa lulus atau tidak
  bool apakahLulus() {
    return nilai > 70;
  }
}

void soalSatu() {
  print("\n\n========= SOAL 1 =========");
  // Membuat objek Siswa
  Siswa siswa1 = Siswa('Wafiq', '12345', 90.0);
  Siswa siswa2 = Siswa('Abdul', '67890', 70.0);

  // Menampilkan informasi siswa1
  siswa1.tampilkanInformasi();
  print('Apakah lulus? ${siswa1.apakahLulus() ? 'Lulus' : 'Tidak Lulus'}');

  // Menampilkan informasi siswa2
  siswa2.tampilkanInformasi();
  print('Apakah lulus? ${siswa2.apakahLulus() ? 'Lulus' : 'Tidak Lulus'}');
}

//SOAL KEDUA - Enkapsulasi
class PersegiPanjang {
  double panjang;
  double lebar;

  // Konstruktor untuk menginisialisasi objek PersegiPanjang
  PersegiPanjang(this.panjang, this.lebar);

  // Method untuk menghitung luas persegi panjang
  double hitungLuas() {
    return panjang * lebar;
  }

  // Method untuk menghitung keliling persegi panjang
  double hitungKeliling() {
    return 2 * (panjang + lebar);
  }
}

void soalDua() {
  print("\n\n========= SOAL 2 =========");
  // Membuat objek PersegiPanjang
  PersegiPanjang persegiPanjang1 = PersegiPanjang(5.0, 3.0);
  PersegiPanjang persegiPanjang2 = PersegiPanjang(7.0, 2.5);

  // Menghitung dan menampilkan luas dan keliling persegiPanjang1
  print('Persegi Panjang 1:');
  print('Panjang: ${persegiPanjang1.panjang}');
  print('Lebar: ${persegiPanjang1.lebar}');
  print('Luas: ${persegiPanjang1.hitungLuas()}');
  print('Keliling: ${persegiPanjang1.hitungKeliling()}');

  // Menghitung dan menampilkan luas dan keliling persegiPanjang2
  print('\nPersegi Panjang 2:');
  print('Panjang: ${persegiPanjang2.panjang}');
  print('Lebar: ${persegiPanjang2.lebar}');
  print('Luas: ${persegiPanjang2.hitungLuas()}');
  print('Keliling: ${persegiPanjang2.hitungKeliling()}');
}

//SOAL KETIGA - Enkapsulasi
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

void soalTiga() {
  print("\n\n========= SOAL 3 =========");
  // Membuat objek Buku
  Buku buku1 = Buku('Laskar Pelangi', 'Andrea Hirata', 2005);
  Buku buku2 = Buku('Bumi Manusia', 'Pramoedya Ananta Toer', 1980);

  // Menampilkan informasi buku1
  buku1.tampilkanInformasi();

  // Menampilkan informasi buku2
  buku2.tampilkanInformasi();
}

//SOAL KEEMPAT - Enkapsulasi
class Mobil {
  String merek;
  String model;
  int tahunProduksi;
  bool _mesinMenyala = false; // Atribut untuk status mesin (private)

  // Konstruktor untuk menginisialisasi objek Mobil
  Mobil(this.merek, this.model, this.tahunProduksi);

  // Method untuk menyalakan mesin mobil
  void nyalakanMesin() {
    if (!_mesinMenyala) {
      _mesinMenyala = true;
      print('Mesin mobil $merek $model tahun $tahunProduksi menyala.');
    } else {
      print('Mesin sudah menyala.');
    }
  }

  // Method untuk mematikan mesin mobil
  void matikanMesin() {
    if (_mesinMenyala) {
      _mesinMenyala = false;
      print('Mesin mobil $merek $model tahun $tahunProduksi mati.');
    } else {
      print('Mesin sudah mati.');
    }
  }
}

void soalEmpat() {
    print("\n\n========= SOAL 4 =========");
  // Membuat objek Mobil
  Mobil mobil1 = Mobil('Toyota', 'Corolla', 2020);
  Mobil mobil2 = Mobil('Honda', 'Civic', 2018);

  // Menyalakan dan mematikan mesin mobil1
  mobil1.nyalakanMesin();
  mobil1.matikanMesin();

  // Menyalakan dan mematikan mesin mobil2
  mobil2.nyalakanMesin();
  mobil2.matikanMesin();
}

//SOAL KELIMA - Inheritance
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

void soalLima() {
  print("\n\n========= SOAL 5 =========");
  // Membuat objek Hewan
  Hewan hewan1 = Hewan('Peno', 5);
  hewan1.tampilkanInformasi();

  // Membuat objek Kucing
  Kucing kucing1 = Kucing('Kitty', 2, 'Persia');
  kucing1.tampilkanInformasi();
  kucing1.mengeong();
}
