import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  bool onOff = false;
  String? selectedDropdown;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
