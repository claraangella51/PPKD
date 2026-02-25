import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool onOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onOff ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
