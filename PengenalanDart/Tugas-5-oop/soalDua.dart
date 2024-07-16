//SOAL KEDUA -
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

void soalkeDua() {
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