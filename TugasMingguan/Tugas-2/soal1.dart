List<int> range(int startNum, int finishNum) {
  List<int> result = [];

  if (startNum <= finishNum) {
    for (int i = startNum; i <= finishNum; i++) {
      result.add(i);
    }
  } else {
    for (int i = startNum; i >= finishNum; i--) {
      result.add(i);
    }
  }

  return result;
}

void soal1() {
  print("\n=========== SOAL 1 ===========");
  print(range(1, 10));
  print(range(11, 18));
}
