import 'package:flutter/material.dart';
import 'package:tugas_7_flutter/beranda.dart';
import 'package:tugas_7_flutter/drawerdemo.dart';
import 'package:tugas_7_flutter/tentang.dart';

class Bottomnavbardemo extends StatefulWidget {
  const Bottomnavbardemo({super.key});

  @override
  State<Bottomnavbardemo> createState() => _BottomnavbardemoState();
}

class _BottomnavbardemoState extends State<Bottomnavbardemo> {
  int _currentIndex = 0;
  void ontapItem(int index) {
    _currentIndex = index;
    setState(() {});
  }

  static List<Widget> listWidget = [DrawerTugas7(), Tentang()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang',
            backgroundColor: Colors.green,
          ),
        ],
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.green),
        currentIndex: _currentIndex,
        onTap: ontapItem,
      ),
    );
  }
}
