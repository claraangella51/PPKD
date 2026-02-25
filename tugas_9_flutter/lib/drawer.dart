import 'package:flutter/material.dart';
import 'package:tugas_9_flutter/list.dart';
import 'package:tugas_9_flutter/list_map_coba.dart';
import 'package:tugas_9_flutter/model.dart';

class DrawerDay14 extends StatefulWidget {
  const DrawerDay14({super.key});

  @override
  State<DrawerDay14> createState() => _DrawerDay14State();
}

class _DrawerDay14State extends State<DrawerDay14> {
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

  static List<Widget> listWidget = [ListDay14(), ListMapDay14(), ModelDay14()];

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
              title: Text('List'),
              onTap: () {
                ontapItemDrawer(0);
              },
            ),
            ListTile(
              title: Text('List Map'),
              onTap: () {
                ontapItemDrawer(1);
              },
            ),
            ListTile(
              title: Text('Model'),
              onTap: () {
                ontapItemDrawer(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
