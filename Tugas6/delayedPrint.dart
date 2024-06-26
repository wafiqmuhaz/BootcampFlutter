import 'dart:async';

Future<void> delayedPrint(String message, int delay) async {
  //menerima sebuah string dan waktu tunda dalam milidetik
  await Future.delayed(Duration(milliseconds: delay));
  print(message);
}

void  main(){
  print("============= SOAL 1 =============");
  //mencetak string setelah waktu tunda selesai
  delayedPrint("Hello, Wafiq Muhaz!", 2000);
}