import 'package:flutter/material.dart';

class Tentang extends StatefulWidget {
  const Tentang({super.key});

  @override
  State<Tentang> createState() => _TentangState();
}

class _TentangState extends State<Tentang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(children: [Text('DIbuat oleh Clara Angella Harsono')]),
        ),
      ),
    );
  }
}
