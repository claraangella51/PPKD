import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Text(
                'Aplikasi ini merupakan aplikasi sederhana berbasis Flutter\nyang dibuat untuk menguji dan memahami implementasi\nbeberapa komponen utama dalam pengembangan antarmuka (UI), yaitu:',
              ),
              Row(
                children: [
                  Icon(Icons.check),
                  Text('Drawer'),
                  Icon(Icons.check),
                  Text('Bottom Nav Bar'),
                  Icon(Icons.check),
                  Text('Input Widget'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
