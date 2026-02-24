//Clara Angella Harsono

/*Tugas Satu Dart
Mengenai pembuatan biodata komunitas baca buku*/

void main() {
  String Nama = "Ella";
  int Umur = 22;
  double tinggiBadan = 173.5;
  bool statusKeanggotaan = true;
  List<String> bukuFavorit = ["Laskar Pelangi, Poor Dad Rich Dad, Atomic Habit"];

  final Map<String, dynamic> dataTambahan = {
    "Jenis Kelamin": "Perempuan",
    "Profesi": "Dokter Gigi",
    "Alamat": "Jl Cempaka Putih Timur"
  };
 
 void menampilkanBiodata () {
  print("Nama = ${Nama}");
  print("Umur = ${Umur}");
  print("Tinggi Badan = ${tinggiBadan}");
  print("Status Keanggotaa = ${statusKeanggotaan}");
  print("Buku Favorit = ${bukuFavorit}");
  print("Jenis Kelamin = ${dataTambahan["Jenis Kelamin"]}");
  print("Profesi = ${dataTambahan["Profesi"]}");
  print("Alamat = ${dataTambahan["Alamat"]}");
 }

menampilkanBiodata();

}