// SOAL PERTAMA - 
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

void soalkeSatu() {
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