
//SOAL KEEMPAT - 
class Mobil {
  String merek;
  String model;
  int tahunProduksi;
  bool _mesinMenyala = false; // Atribut untuk status mesin (private)

  // Konstruktor untuk menginisialisasi objek Mobil
  Mobil(this.merek, this.model, this.tahunProduksi);

  // Method untuk menyalakan mesin mobil
  void nyalakanMesin() {
    if (!_mesinMenyala) {
      _mesinMenyala = true;
      print('Mesin mobil $merek $model tahun $tahunProduksi menyala.');
    } else {
      print('Mesin sudah menyala.');
    }
  }

  // Method untuk mematikan mesin mobil
  void matikanMesin() {
    if (_mesinMenyala) {
      _mesinMenyala = false;
      print('Mesin mobil $merek $model tahun $tahunProduksi mati.');
    } else {
      print('Mesin sudah mati.');
    }
  }
}

void soalkeEmpat() {
    print("\n\n========= SOAL 4 =========");
  // Membuat objek Mobil
  Mobil mobil1 = Mobil('Toyota', 'Corolla', 2020);
  Mobil mobil2 = Mobil('Honda', 'Civic', 2018);

  // Menyalakan dan mematikan mesin mobil1
  mobil1.nyalakanMesin();
  mobil1.matikanMesin();

  // Menyalakan dan mematikan mesin mobil2
  mobil2.nyalakanMesin();
  mobil2.matikanMesin();
}