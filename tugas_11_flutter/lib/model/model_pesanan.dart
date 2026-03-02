class PemesananModel {
  int? id;
  String? namaPelanggan;
  String? noHp;
  String? alamat;
  String? jenisLayanan;
  String? keluhan;

  PemesananModel({
    this.id,
    this.namaPelanggan,
    this.noHp,
    this.alamat,
    this.jenisLayanan,
    this.keluhan,
  });

  Map<String, dynamic> toMap() {
    return {
      "namaPelanggan": namaPelanggan,
      "noHp": noHp,
      "alamat": alamat,
      "jenisLayanan": jenisLayanan,
      "keluhan": keluhan,
    };
  }

  factory PemesananModel.fromMap(Map<String, dynamic> map) {
    return PemesananModel(
      id: map["id"],
      namaPelanggan: map["namaPelanggan"],
      noHp: map["noHp"],
      alamat: map["alamat"],
      jenisLayanan: map["jenisLayanan"],
      keluhan: map["keluhan"],
    );
  }
}
