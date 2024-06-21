import 'dart:io';

void main() {
  print(teriak()); //Soal 1
  nomorDua(); //Soal 2
  nomorTiga(); //Soal 3
  nomorEmpat(); //Soal 4
}

// Soal Nomor Satu
String teriak() {
  print("====Soal Pertama====");
  return 'Halo Sanbers!';
}

// Soal Nomor Dua
void nomorDua() {
  print("====Soal Kedua====");
  var num1 = 12;
  var num2 = 4;

  var hasilKali = kalikan(num1, num2);
  print(hasilKali); // 48
}

int kalikan(int a, int b) {
  return a * b;
}

// Soal Nomor Tiga
void nomorTiga() {
  print("====Soal Ketiga====");
  var name = "Agus";
  var age = 30;
  var address = "Jln. Malioboro, Yogyakarta";
  var hobby = "Gaming";

  var perkenalan = introduce(name, age, address, hobby);
  print(perkenalan); // Menampilkan "Nama saya Agus, umur saya 30 tahun, alamat saya di Jln. Malioboro, Yogyakarta, dan saya punya hobby yaitu Gaming!"
}

String introduce(String name, int age, String address, String hobby) {
  return 'Nama saya $name, umur saya $age tahun, alamat saya di $address, dan saya punya hobby yaitu $hobby!';
}

// Soal Nomor Empat

void nomorEmpat() {
    print("====Soal Keempat====");
  // Meminta input dari pengguna
  print('Masukkan sebuah angka: ');
  String? input = stdin.readLineSync();
  int number = int.parse(input!);

  // Menghitung faktorial
  int result = faktorial(number);
  print('Faktorial dari $number adalah $result');
}

int faktorial(int n) {
  if (n <= 0) {
    return 1;
  } else {
    int hasil = 1;
    for (int i = n; i > 1; i--) {
      hasil *= i;
    }
    return hasil;
  }
}
