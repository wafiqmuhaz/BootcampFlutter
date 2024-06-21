import 'dart:io';

//Jawaban Soal 1 Bagian A <===============================

// ignore_for_file: dead_code

void main() {
  bool tokoBuka = true;

  if (tokoBuka) {
    print('Saya akan membeli telur');
  } else {
    print('Saya akan datang lagi esok hari');
  }

  print('Masukkan nilai ujian: ');
  String? inputNilai = stdin.readLineSync();
  int nilai = int.parse(inputNilai!);

  //Jawaban Soal 1 Bagian B <===============================

  if (nilai >= 80) {
    print('A: Sangat Baik');
  } else if (nilai >= 70 && nilai <= 79) {
    print('B: Baik');
  } else if (nilai >= 60 && nilai <= 69) {
    print('C: Cukup');
  } else if (nilai >= 50 && nilai <= 59) {
    print('D: Kurang');
  } else {
    print('E: Sangat Kurang');
  }

}
