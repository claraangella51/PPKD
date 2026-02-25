import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _ischeck = false;
  bool onOff = false;
  String? selectedDropdown;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onOff ? Colors.black : Colors.white,
      appBar: AppBar(title: Text("Input Widget")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Text(
                "Syarat & Ketentuan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: onOff ? Colors.white : Colors.black,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _ischeck,
                    onChanged: (value) {
                      _ischeck = value ?? false;
                      setState(() {});
                    },
                  ),
                  Text(
                    _ischeck
                        ? " Saya menyetujui semua persyaratan\n yang berlaku\n Lanjutkan pendaftaran diperbolehkan"
                        : " Saya menyetujui semua persyaratan\n yang berlaku\n Anda belum bisa melanjutkan",
                    style: TextStyle(
                      color: onOff ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Aktifkan mode gelap",
                style: TextStyle(color: onOff ? Colors.white : Colors.black),
              ),
              Switch(
                value: onOff,
                onChanged: (value) {
                  onOff = value ?? false;
                  setState(() {
                    onOff = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Text(
                "Pilih Kategori Produk",
                style: TextStyle(color: onOff ? Colors.white : Colors.black),
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                ),
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
              SizedBox(height: 16),
              Text(
                "Atur Tanggal",
                style: TextStyle(color: onOff ? Colors.white : Colors.black),
              ),
              // Text(Dateform),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1940),
                    lastDate: DateTime(2027),
                    initialDate: DateTime.now(),
                  );
                  if (picked != null) {
                    selectedDate = picked;
                    setState(() {});
                  }
                },
                child: Text("Pilih Tanggal Lahir"),
              ),
              Text(
                "Tanggal Lahir: ${DateFormat('dd MMMM yyyy', 'id').format(selectedDate)}",
                style: TextStyle(
                  color: onOff ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 32),

              Text(
                'Pengingat',
                style: TextStyle(color: onOff ? Colors.white : Colors.black),
              ),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,

                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      selectedTime = picked;
                    });
                  }
                },
                child: Text("Pilih Waktu Pengingat"),
              ),
              Text(
                "Pengingat diatur pukul ${DateFormat('HH:mm').format(DateTime(0, 0, 0, selectedTime.hour, selectedTime.minute))}",
                style: TextStyle(
                  color: onOff ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
