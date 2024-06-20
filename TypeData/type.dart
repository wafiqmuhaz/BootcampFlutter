import 'dart:io';

void main() {
  // Soal 1: Uraikan dengan bahasa teman teman di commant di visual studio code nya:
  int angkaInt1 = 10;
  int angkaInt2 = -3;
  int angkaInt3 = 0;

  // 2. Float:
  double angkaFloat1 = 10.5;
  double angkaFloat2 = -3.14;
  double angkaFloat3 = 0.0;

  print('Integer: $angkaInt1, $angkaInt2, $angkaInt3');
  print('Float: $angkaFloat1, $angkaFloat2, $angkaFloat3');
  String nama = "Budi";

  // Menyimpan kalimat
  String kalimat = "Hari ini cuacanya sangat cerah.";

  // Menyimpan angka sebagai teks
  String angkaSebagaiTeks = "12345";

  // String juga bisa kosong
  String stringKosong = "";

  print('Nama: $nama');
  print('Kalimat: $kalimat');
  print('Angka sebagai teks: $angkaSebagaiTeks');
  print('String kosong: "$stringKosong"');

// Soal No. 2 (Membuat kalimat),
// Terdapat kumpulan variable dengan data string sebagai berikut
// Variabel-variabel dengan data string
  var word = 'dart';
  var second = 'is';
  var third = 'awesome';
  var fourth = 'and';
  var fifth = 'I';
  var sixth = 'love';
  var seventh = 'it!';

  // Menggabungkan variabel-variabel menjadi satu kalimat
  var sentence = '${word[0].toUpperCase()}${word.substring(1)} $second $third $fourth $fifth $sixth $seventh';

  // Menampilkan hasil
  print(sentence);

  //Soal No.3 Mengurai kalimat (Akses karakter dalam string),
  var sentences = "I am going to be Flutter Developer";

  var exampleFirstWord = sentences[0];
  var exampleSecondWord = sentences.substring(2, 4);
  var thirdWord = sentences.substring(5, 10);
  var fourthWord = sentences.substring(11, 13);
  var fifthWord = sentences.substring(14, 16);
  var sixthWord = sentences.substring(17, 24);
  var seventhWord = sentences.substring(25, 34);

  print('First Word: ' + exampleFirstWord);
  print('Second Word: ' + exampleSecondWord);
  print('Third Word: ' + thirdWord);
  print('Fourth Word: ' + fourthWord);
  print('Fifth Word: ' + fifthWord);
  print('Sixth Word: ' + sixthWord);
  print('Seventh Word: ' + seventhWord);

  // SOALKE-4
  // Dengan menggunakan I/O pada dart buatlah input dinamis yang akan menginput nama depan dan belakang dan jika di enter
  // akan menggabungkan nama depan dan belakang

  // Meminta input nama depan
  stdout.write('Masukkan nama depan: ');
  String? firstName = stdin.readLineSync();

  // Meminta input nama belakang
  stdout.write('Masukkan nama belakang: ');
  String? lastName = stdin.readLineSync();

  // Menggabungkan nama depan dan belakang jika tidak null
  if (firstName != null && lastName != null) {
    String fullName = '$firstName $lastName';
    print('Nama lengkap anda adalah: $fullName');
  } else {
    print('Input tidak valid.');
  }

  // SOAL KE-5
  // Dengan menggunakan operator operasikan variable berikut ini menjadi bentuk operasi perkalian, penjumlahan, pengurangan dan pembagian a = 5,  b = 10 jadi misal a * b = 5 * 10 = 50 dst.
  int a = 5;
  int b = 10;

  // Operasi perkalian
  int hasilKali = a * b;
  print('$a * $b = $hasilKali'); // Output: 5 * 10 = 50

  // Operasi penjumlahan
  int hasilJumlah = a + b;
  print('$a + $b = $hasilJumlah'); // Output: 5 + 10 = 15

  // Operasi pengurangan
  int hasilKurang = a - b;
  print('$a - $b = $hasilKurang'); // Output: 5 - 10 = -5

  // Operasi pembagian
  double hasilBagi = a / b;
  print('$a / $b = $hasilBagi'); // Output: 5 / 10 = 0.5
}