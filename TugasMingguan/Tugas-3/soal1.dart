class Segitiga {
  double alas;
  double tinggi;

  Segitiga(this.alas, this.tinggi);

  double hitungLuas() {
    return 0.5 * alas * tinggi;
  }
}

void main() {
  // Membuat objek Segitiga
  Segitiga segitiga = Segitiga(20.0, 30.0);

  // Menghitung luas segitiga
  double luasSegitiga = segitiga.hitungLuas();

  // Menampilkan luas segitiga
  print(luasSegitiga);
}