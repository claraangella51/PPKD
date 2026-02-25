import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool _ischeck = false;
  bool onOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onOff ? Colors.black : Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
