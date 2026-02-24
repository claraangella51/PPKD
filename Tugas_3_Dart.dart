void main() {
  /*Soal 1
  Program Dart yang menampilkan bilangan ganjil dari 1 hingga 20*/
  for (int i = 1; i <= 20; i += 2) {
    print(i);
  }

  /*Soal 2
  Mencetak karakter bintang (*) sebanyak 5 kali dalam satu baris*/
  int m = 0;
  while (m < 5) {
    print("*");
    m++;
  }

  /*Soal 3
  Tampilkan nama Anda sebanyak 4 kali menggunakan perulangan while*/
  int j = 0;
  while (j < 4) {
    print("Clara Angella");
    j++;
  }

  /*Soal 4
  Perulangan dalam list*/
  List<String> namaBuah = [
    "Strawberry",
    "Blueberry",
    "Blackberry",
    "Raspberry",
  ];
  namaBuah.forEach((buah) {
    print(buah);
  });

  /*Soal 5
  Buatlah sebuah program Dart yang menampilkan list daftar belanja menggunakan loop.*/
  List<String> daftarBelanja = ["Beras", "Telur", "Minyak Goreng", "Gula"];
  for (int i = 0; i < daftarBelanja.length; i++) {
    print("Item ke ${i + 1}: ${daftarBelanja[i]}");
  }
}
