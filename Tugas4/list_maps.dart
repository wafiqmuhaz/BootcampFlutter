void main(){
  soalSatu();
  soalDua();
  soalTiga();
  soalEmpat();
}

void soalSatu() {
  print("========= Soal 1 =========\n");
  List<int> numbers = [1, 2, 3, 4, 5];

  numbers.forEach((number) {
    print(number);
  });
}

void soalDua() {
  print("\n\n========= Soal 2 =========\n");

  List<String> fruits = ['Apple', 'Banana', 'Orange'];

  // Sebelum ditambahkan
  print('Sebelum ditambahkan: $fruits');

  // Menambahkan buah baru
  fruits.add('Mango');
  print('Setelah menambahkan Mango: $fruits');

  // Menghapus nama buah yang paling belakang
  fruits.removeLast();
  print('Setelah menghapus buah terakhir: $fruits');
}

void soalTiga() {
  print("\n\n========= Soal 3 =========\n");

  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];

  List<int> combinedList = list1 + list2;
  print('List gabungan: $combinedList');
}

void soalEmpat() {
  print("\n\n========= Soal 4 =========\n");

  Map<String, String> dataDiri = {
    'nama': 'Wafiq Muhaz',
    'alamat': 'Soreang, Bandung',
    'email': 'wafiqmuhaz@gmail.com',
    'phoneNumber': '08139313'
  };
  print(dataDiri);

  print("\n\n========= Soal 5 =========\n");
  print('Data Diri:');
  dataDiri.forEach((key, value) {
    print('$key: $value');
  });
}