void main() {
  loopingWhile();
  loopingFor();
  persegiPanjang();
  membuatTangga();
}


void loopingWhile() {
  print('LOOPING PERTAMA WHILE');
  int i = 2;
  while (i <= 20) {
    print('$i - I love coding');
    i += 2;
  }

  // Looping kedua
  print('LOOPING KEDUA WHILE');
  int j = 20;
  while (j >= 2) {
    print('$j - I will become a mobile developer');
    j -= 2;
  }
}

void loopingFor() {
  print('LOOPING FOR');
  //A. Jika angka ganjil maka tampilkan Santai
  //B. Jika angka genap maka tampilkan Berkualitas
  //C. Jika angka yang sedang ditampilkan adalah kelipatan 3 dan angka ganjil maka tampilkan I Love Coding.
  for (int i = 1; i <= 20; i++) {
    if (i % 3 == 0 && i % 2 != 0) {
      print('$i - I Love Coding');
    } else if (i % 2 == 0) {
      print('$i - Berkualitas');
    } else {
      print('$i - Santai');
    }
  }
}

void persegiPanjang() {
  print('Persegi Panjang #');
  int rows = 4;
  int columns = 8;

  for (int i = 0; i < rows; i++) {
    String row = '';
    for (int j = 0; j < columns; j++) {
      row += '#';
    }
    print(row);
  }
}

void membuatTangga() {
  int height = 7;

  for (int i = 1; i <= height; i++) {
    String row = '';
    for (int j = 1; j <= i; j++) {
      row += '#';
    }
    print(row);
  }
}

