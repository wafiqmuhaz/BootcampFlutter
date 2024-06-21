void main() {

  //Jawaban Soal 3 Bagian A <===============================

  double panjang = 10.0;
  double lebar = 5.0;

  double luas = hitungLuas(panjang, lebar);
  double keliling = hitungKeliling(panjang, lebar);

  print('Luas Persegi Panjang: $luas');
  print('Keliling Persegi Panjang: $keliling');

  //Jawaban Soal 3 Bagian B <===============================

  String nama = 'Budi';
  int usia = 20;
  String jurusan = 'Teknik Informatika';

  cetakInformasiMahasiswa(nama, usia, jurusan);
}

//Jawaban Soal 3 FUNGSI Bagian A <===============================

double hitungLuas(double panjang, double lebar) {
  return panjang * lebar;
}

double hitungKeliling(double panjang, double lebar) {
  return 2 * (panjang + lebar);
}

//Jawaban Soal 3 FUNGSI Bagian B <===============================

void cetakInformasiMahasiswa(String nama, int usia, String jurusan) {
  print('Nama Mahasiswa: $nama');
  print('Usia: $usia tahun');
  print('Jurusan: $jurusan');
}