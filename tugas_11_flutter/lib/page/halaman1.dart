import 'package:flutter/material.dart';
import 'package:tugas_11_flutter/model/model_pesanan.dart';
import 'package:tugas_11_flutter/database/database_pertukangan.dart';

class Hal1 extends StatefulWidget {
  const Hal1({super.key});

  @override
  State<Hal1> createState() => _Hal1State();
}

class _Hal1State extends State<Hal1> {
  late Future<List<PemesananModel>> _listPemesanan;
  final DBHelper dbHelper = DBHelper();

  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final noHpController = TextEditingController();
  final alamatController = TextEditingController();
  final keluhanController = TextEditingController();

  String? selectedLayanan;
  final List<String> layananList = [
    "Kelistrikan",
    "AC",
    "Kendaraan",
    "Pipa",
    "Elektronik",
    "Instalasi",
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _listPemesanan = dbHelper.getAllPemesanan();
  }

  void _simpanData() async {
    if (_formKey.currentState!.validate()) {
      final data = PemesananModel(
        namaPelanggan: namaController.text,
        noHp: noHpController.text,
        alamat: alamatController.text,
        jenisLayanan: selectedLayanan,
        keluhan: keluhanController.text,
      );

      await dbHelper.insertPemesanan(data);

      // Kosongkan form
      namaController.clear();
      noHpController.clear();
      alamatController.clear();
      keluhanController.clear();
      setState(() {
        selectedLayanan = null;
        _loadData(); // refresh FutureBuilder
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Data berhasil disimpan")));
    }
  }

  void _showEditDialog(PemesananModel item) {
    final editNama = TextEditingController(text: item.namaPelanggan);
    final editNoHp = TextEditingController(text: item.noHp);
    final editAlamat = TextEditingController(text: item.alamat);
    final editKeluhan = TextEditingController(text: item.keluhan);
    String? editLayanan = item.jenisLayanan;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Data"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: editNama,
                decoration: const InputDecoration(labelText: "Nama"),
              ),
              TextField(
                controller: editNoHp,
                decoration: const InputDecoration(labelText: "No HP"),
              ),
              TextField(
                controller: editAlamat,
                decoration: const InputDecoration(labelText: "Alamat"),
              ),
              DropdownButtonFormField<String>(
                value: editLayanan,
                decoration: const InputDecoration(labelText: "Jenis Layanan"),
                items: layananList
                    .map(
                      (layanan) => DropdownMenuItem(
                        value: layanan,
                        child: Text(layanan),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  editLayanan = value;
                },
              ),
              TextField(
                controller: editKeluhan,
                decoration: const InputDecoration(labelText: "Keluhan"),
                maxLines: 2,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () async {
              final updatedData = PemesananModel(
                id: item.id,
                namaPelanggan: editNama.text,
                noHp: editNoHp.text,
                alamat: editAlamat.text,
                jenisLayanan: editLayanan,
                keluhan: editKeluhan.text,
              );

              await dbHelper.updatePemesanan(updatedData);

              Navigator.pop(context);

              setState(() {
                _loadData();
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Data berhasil diupdate")),
              );
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi Hapus"),
        content: const Text("Apakah yakin ingin menghapus data ini?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await dbHelper.deletePemesanan(id);

              Navigator.pop(context);

              setState(() {
                _loadData();
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Data berhasil dihapus")),
              );
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pemesanan Tukang")),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: namaController,
                      decoration: const InputDecoration(labelText: "Nama"),
                      validator: (value) =>
                          value!.isEmpty ? "Nama harus diisi" : null,
                    ),
                    TextFormField(
                      controller: noHpController,
                      decoration: const InputDecoration(labelText: "No HP"),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "No HP harus diisi";
                        if (int.tryParse(value) == null)
                          return "No HP harus angka";
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: alamatController,
                      decoration: const InputDecoration(labelText: "Alamat"),
                      validator: (value) =>
                          value!.isEmpty ? "Alamat harus diisi" : null,
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedLayanan,
                      decoration: const InputDecoration(
                        labelText: "Jenis Layanan",
                      ),
                      items: layananList
                          .map(
                            (layanan) => DropdownMenuItem(
                              value: layanan,
                              child: Text(layanan),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedLayanan = value; // ✅ perbaikan
                        });
                      },
                      validator: (value) =>
                          value == null ? "Pilih jenis layanan" : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: keluhanController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: "Keluhan",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Keluhan harus diisi" : null,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: _simpanData,
                      child: const Text("Simpan"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: FutureBuilder<List<PemesananModel>>(
              future: _listPemesanan,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Belum ada data"));
                }

                final data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(item.namaPelanggan ?? ""),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("No Telp: ${item.noHp ?? ""}"),
                            Text("Alamat: ${item.alamat ?? ""}"),
                            Text("Jenis Layanan: ${item.jenisLayanan ?? ""}"),
                            Text("Keluhan: ${item.keluhan ?? ""}"),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                _showEditDialog(item);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _showDeleteDialog(item.id!);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
