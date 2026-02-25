import 'package:flutter/material.dart';
import 'package:tugas_7_flutter/screen2.dart';
import 'package:tugas_7_flutter/screen1.dart';
import 'package:tugas_7_flutter/screen3.dart';
import 'package:tugas_7_flutter/screen4.dart';
import 'package:tugas_7_flutter/screen5.dart';
import 'package:tugas_7_flutter/beranda.dart';

class DrawerTugas7 extends StatefulWidget {
  const DrawerTugas7({super.key});

  @override
  State<DrawerTugas7> createState() => _DrawerTugas7();
}

class _DrawerTugas7 extends State<DrawerTugas7> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void ontapItem(int index) {
    _currentIndex = index;
    setState(() {});
  }

  void ontapItemDrawer(int index) {
    _currentIndex = index;
    setState(() {});
    Navigator.pop(context);
  }

  static List<Widget> listWidget = [
    Beranda(),
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
    Screen5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: listWidget[_currentIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Container(color: Colors.green)),
            ListTile(
              title: Text('Beranda'),
              onTap: () {
                ontapItemDrawer(0);
              },
            ),
            ListTile(
              title: Text('Syarat & Ketentuan'),
              onTap: () {
                ontapItemDrawer(1);
              },
            ),
            ListTile(
              title: Text('Mode Gelap'),
              onTap: () {
                ontapItemDrawer(2);
              },
            ),
            ListTile(
              title: Text('Kategori Produk'),
              onTap: () {
                ontapItemDrawer(3);
              },
            ),
            ListTile(
              title: Text('Tanggal Lahir'),
              onTap: () {
                ontapItemDrawer(4);
              },
            ),
            ListTile(
              title: Text('Waktu Pengingat'),
              onTap: () {
                ontapItemDrawer(5);
              },
            ),
          ],
        ),
      ),
    );
  }
}
