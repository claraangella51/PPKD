import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool onOff = false;
  String? selectedDropdown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onOff ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              "Pilih Kategori Produk",
              style: TextStyle(color: onOff ? Colors.white : Colors.black),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(fillColor: Colors.grey, filled: true),
              initialValue: selectedDropdown,
              hint: Text(
                "Pilih Kategori Produk",
                style: TextStyle(color: onOff ? Colors.white : Colors.black),
              ),
              items: ["Elektronik", "Pakaian", "Makanan"].map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDropdown = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
