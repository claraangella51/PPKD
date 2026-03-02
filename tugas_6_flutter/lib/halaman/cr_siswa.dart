import 'package:flutter/material.dart';
import 'package:tugas_6_flutter/database/siswa_controller.dart';
import 'package:tugas_6_flutter/models/siswa_model.dart';

class CrSiswa extends StatefulWidget {
  const CrSiswa({super.key});

  @override
  State<CrSiswa> createState() => _CrSiswaState();
}

class _CrSiswaState extends State<CrSiswa> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController kelascontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: namecontroller,
            decoration: InputDecoration(
              hintText: 'Masukkan Nama Siswa',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 24),
          TextFormField(
            controller: kelascontroller,
            decoration: InputDecoration(
              hintText: 'Masukkan Kelas Siswa',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (namecontroller.text.isEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Nama belum diisi')));
                  return;
                }
                if (kelascontroller.text.isEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Kelas belum diisi')));
                  return;
                }
                SiswaController.registerSiswa(
                  SiswaModel(
                    nama: namecontroller.text,
                    kelas: kelascontroller.text,
                  ),
                );
                namecontroller.clear();
                kelascontroller.clear();
              },

              child: Text('Tambah siswa'),
            ),
            FutureBuilder<List<SiswaModel>>(
              future: SiswaController.getAllSiswa(),
              builder:
                  (
                    BuildContext context,
                    AsyncSnapshot<List<SiswaModel>> snapshot,
                  ) {
                    // Loading
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // Error
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    // Data kosong
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('Data siswa kosong'));
                    }

                    final dataSiswa = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataSiswa.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = dataSiswa[index];

                        return ListTile(
                          title: Text(items.nama ?? ''),
                          subtitle: Text(items.kelas ?? ''),
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
