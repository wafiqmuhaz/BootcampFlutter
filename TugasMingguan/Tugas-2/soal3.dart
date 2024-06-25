void dataHandling(List<List<String>> data) {
  for (var person in data) {
    print("Nomor ID: ${person[0]}");
    print("Nama Lengkap: ${person[1]}");
    print("TTL: ${person[2]} ${person[3]}");
    print("Hobi: ${person[4]}\n");
  }
}

void soal3() {
  print("\n\n=========== SOAL 3 ===========");
  var input = [
    ["0001", "Roman Alamsyah", "Bandar Lampung", "21/05/1989", "Membaca"],
    ["0002", "Dika Sembiring", "Medan", "10/10/1992", "Bermain Gitar"],
    ["0003", "Winona", "Ambon", "25/12/1965", "Memasak"],
    ["0004", "Bintang Senjaya", "Martapura", "6/4/1970", "Berkebun"],
    ["0005", "Wafiq Muh", "Bandung", "27/05/2000", "Hiking"]
  ];

  dataHandling(input);
}