import 'dart:async';

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  //mengembalikan string setelah waktu tunda
  return "Data diambil!";
}

//menggunakan async dan await untuk menampilkan hasil dari fetchData
Future<void> main() async {
    print("============= SOAL 2 =============");
  print("mengambil data...");
  String data = await fetchData();
  print(data); // setelah 2 detik ngeprint
}
