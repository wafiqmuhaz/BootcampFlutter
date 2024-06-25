List<int> rangeWithStep(int startNum, int finishNum, int step) {
  List<int> result = [];

  if (startNum <= finishNum) {
    for (int i = startNum; i <= finishNum; i += step) {
      result.add(i);
    }
  } else {
    for (int i = startNum; i >= finishNum; i -= step) {
      result.add(i);
    }
  }

  return result;
}

void soal2() {
  print("\n\n=========== SOAL 2 ===========");
  print(rangeWithStep(1, 10, 2)); // [1, 3, 5, 7, 9]
  print(rangeWithStep(11, 23, 3)); // [11, 14, 17, 20, 23]
  print(rangeWithStep(5, 2, 1)); // [5, 4, 3, 2]
}
