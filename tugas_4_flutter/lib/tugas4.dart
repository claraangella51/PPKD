import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tugas 4'), backgroundColor: Colors.amber),
      body: ListView(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amberAccent),
              borderRadius: BorderRadius.circular(10),
              color: Colors.amberAccent,
            ),
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      iconColor: Colors.white,
                      labelText: "Nama",
                      hintText: "Masukkan nama",
                    ),
                    groupId: SizedBox(height: 10),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      iconColor: Colors.white,
                      labelText: "Email",
                      hintText: "Masukkan email",
                    ),
                    groupId: SizedBox(height: 10),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      iconColor: Colors.white,
                      labelText: "Nama",
                      hintText: "Masukkan nama",
                    ),
                    groupId: SizedBox(height: 10),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.home),
                      iconColor: Colors.white,
                      labelText: "Alamat",
                      hintText: "Masukkan alamat",
                    ),
                    groupId: SizedBox(height: 10),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amberAccent),
              borderRadius: BorderRadius.circular(10),
              color: Colors.amberAccent,
            ),
            child: Text(
              "Daftar Teman",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Clara Angella"),
            subtitle: Text("087768866644"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Hafshah Azzahra"),
            subtitle: Text("087768866644"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Shafiyyah Saadiqah"),
            subtitle: Text("087768866644"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Muhammad Haidar"),
            subtitle: Text("087768866644"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Rasyad Maulana"),
            subtitle: Text("087768866644"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Azka Aditya"),
            subtitle: Text("087768866644"),
          ),
        ],
      ),
    );
  }
}
