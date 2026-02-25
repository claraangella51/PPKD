import 'package:flutter/material.dart';

class ListDay14 extends StatefulWidget {
  ListDay14({super.key});

  @override
  State<ListDay14> createState() => _ListDay14State();
}

class _ListDay14State extends State<ListDay14> {
  final List<String> dataAlat = [
    "Pulpen",
    "Pensil",
    "Penghapus",
    "Rautan Pensil",
    "Spidol",
    "Stabilo",
    "Penggaris",
    "Buku Catatan",
    "Map Folder",
    "Stopmap",
    "Stapler",
    "Isi Staples",
    "Paper Clip",
    "Binder Clip",
    "Lakban",
    "Gunting",
    "Kalkulator",
    "Printer",
    "Kertas HVS",
    "Tempat Pensil",
  ];

  void hapusItem(int index) {
    setState(() {
      dataAlat.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Alat Kantor")),
      body: ListView.builder(
        itemCount: dataAlat.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.inventory),
            title: Text(dataAlat[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                hapusItem(index);
              },
            ),
          );
        },
      ),
    );
  }
}
