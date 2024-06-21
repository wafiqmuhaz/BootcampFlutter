void main() {
  loopingWhile();
  loopingFor();
}


void loopingWhile() {
  print('LOOPING PERTAMA FOR');
  int i = 2;
  while (i <= 20) {
    print('$i - I love coding');
    i += 2;
  }

  // Looping kedua
  print('LOOPING KEDUA FOR');
  int j = 20;
  while (j >= 2) {
    print('$j - I will become a mobile developer');
    j -= 2;
  }
}

void loopingFor() {
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