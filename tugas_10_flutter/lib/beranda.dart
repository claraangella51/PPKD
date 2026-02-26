import 'package:flutter/material.dart';

class BerandaDay15 extends StatelessWidget {
  final String name;
  final String city;

  const BerandaDay15({super.key, required this.name, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            "Terima kasih $name dari $city sudah mendaftar",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
