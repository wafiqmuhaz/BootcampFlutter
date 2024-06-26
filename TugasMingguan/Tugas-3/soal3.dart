void main(List<String> args) {
  print("Life");

  Future.delayed(Duration(seconds: 1), () {
    print("is");
  });

  Future.delayed(Duration(seconds: 2), () {
    print("never flat");
  });
}
