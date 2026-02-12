import 'dart:io';

void main() {
  // Meminta input nilai UTS
  stdout.write("Ketikkan nilai UTS Anda");
  String? inputNilai1 = stdin.readLineSync(); // Membaca input sebagai String

  // Meminta input nilai UAS
  stdout.write("Ketikkan nilai UAS Anda");
  String? inputNilai2 = stdin.readLineSync(); // Membaca input sebagai String

  // Meminta input persentase kehadiran
  stdout.write("Ketikkan persentase kehadiran Anda");
  String? inputKehadiran = stdin.readLineSync(); // Membaca input sebagai String

  // Mengubah string input menjadi angka (int)
  int nilai1 = int.parse(inputNilai1 ?? "0");
  int nilai2 = int.parse(inputNilai2 ?? "0");
  int kehadiran = int.parse(inputKehadiran ?? "0");

  // Menentukan lulus atau tidak lulusnya peserta
  double rerataNilai = nilai1 + nilai2 / 2;
  bool lulus = (rerataNilai >= 70) && (kehadiran >= 75);

  // Menampilkan hasil
  if (lulus) {
    print("Selamat, Anda lulus!");
  } else {
    print("Maaf, Anda tidak lulus.");
  }
}
