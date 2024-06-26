import 'dart:async';

void main(List<String> args) async {
  var h = Human();

  print("Luffy");
  print("zoro");
  print("killer");
  await h.getData();
  print(h.name);
}

class Human {
  String name = "nama character one piece";

  Future<void> getData() async {
    await Future.delayed(Duration(seconds: 3));
    name = "hilmy";
    print("get data [done]");
  }
}