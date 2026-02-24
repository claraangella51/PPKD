import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tugas 3 Flutter"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                iconColor: Colors.amberAccent,
                labelText: "Nama",
                hintText: "Masukkan nama",
              ),
              groupId: SizedBox(height: 10),
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                iconColor: Colors.amberAccent,
                labelText: "Email",
                hintText: "Masukkan email",
              ),
              groupId: SizedBox(height: 10),
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.password),
                iconColor: Colors.amberAccent,
                labelText: "Password",
                hintText: "Masukkan password",
              ),
              groupId: SizedBox(height: 10),
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.confirmation_num),
                iconColor: Colors.amberAccent,
                labelText: "Konfimasi Password",
                hintText: "Masukkan konfirmasi password",
              ),
              groupId: SizedBox(height: 10),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      Container(color: Colors.pink),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.laptop_mac, color: Colors.white),
                              Text(
                                "Macbook",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(color: Colors.blue),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(Icons.laptop_mac, color: Colors.white),
                          ),
                          Text(
                            "Macbook",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(color: Colors.purple),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.laptop_mac, color: Colors.white),
                          Text(
                            "Macbook",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(color: Colors.brown),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.laptop_mac, color: Colors.white),
                          Text(
                            "Macbook",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(color: Colors.red),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.laptop_mac, color: Colors.white),
                          Text(
                            "Macbook",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(color: Colors.green),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.laptop_mac, color: Colors.white),
                          Text(
                            "Macbook",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
