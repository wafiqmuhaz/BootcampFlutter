
// ignore_for_file: dead_code

void main() {

  //Jawaban Soal 2 Bagian A <===============================

  // Mencetak deret angka dari 1 hingga 10 secara berurutan
  print('===============Deret angka secara berurutan menggunakan for:===============');
  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  // Mencetak deret angka dari 1 hingga 10 secara terbalik
  print('===============Deret angka secara terbalik menggunakan for:===============');
  for (int i = 10; i >= 1; i--) {
    print(i);
  }

  //Jawaban Soal 2 Bagian B <===============================

   // Mencetak deret angka dari 1 hingga 10 secara berurutan
  print('===============Deret angka secara berurutan menggunakan while:===============');
  int i = 1;
  while (i <= 10) {
    print(i);
    i++;
  }

  // Mencetak deret angka dari 1 hingga 10 secara terbalik
  print('===============Deret angka secara terbalik menggunakan while:===============');
  int j = 10;
  while (j >= 1) {
    print(j);
    j--;
  }
}