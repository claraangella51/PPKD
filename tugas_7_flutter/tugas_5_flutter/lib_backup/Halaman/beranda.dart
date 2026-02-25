import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  int selectedIndex = 0;

  final pages = const [
    Center(child: Text("Beranda")),
    Center(child: Text("Order")),
    Center(child: Text("Fina")),
    Center(child: Text("Chat")),
    Center(child: Text("Profil")),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        height: 54,
        margin: EdgeInsets.fromLTRB(32, 0, 32, 32),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 58, 58, 58),
          border: Border.all(color: Color.fromARGB(255, 101, 101, 101)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(34, 46, 34, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8),
            Text(
              "Selamat Pagi",
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.left,
            ),
            Text(
              "Hafshah Safiyyatus Saadiqah",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 44, 44, 44),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 101, 101, 101),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: const Color.fromARGB(255, 101, 101, 101),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Cari layanan...",
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 44, 44, 44),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 101, 101, 101),
                  width: 1,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Image(
                          image: AssetImage("assets/images/danang.png"),
                          width: 145,
                          height: 145,
                          alignment: Alignment.centerLeft,
                        ),
                        Positioned(
                          top: 16,
                          right: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(),
                            width: 52,
                            height: 16,
                            alignment: Alignment.topRight,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                255,
                                58,
                                58,
                                58,
                              ).withOpacity(25 / 100),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                  size: 10,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "4.9/5",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'PROMO\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '50% potongan harga\nkhusus hari Jum\'at',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          'selengkapnya',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Layanan",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              shrinkWrap: true,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 44, 44),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 101, 101, 101),
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber.withValues(alpha: 0.25),
                          border: Border.all(color: Colors.amberAccent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 45,
                        height: 45,
                        child: Icon(Icons.ac_unit, color: Colors.amber),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "AC",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 44, 44),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 101, 101, 101),
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber.withValues(alpha: 0.25),
                          border: Border.all(color: Colors.amberAccent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 45,
                        height: 45,
                        child: Icon(Icons.bubble_chart, color: Colors.amber),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Kelistrikan",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 44, 44),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 101, 101, 101),
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber.withValues(alpha: 0.25),
                          border: Border.all(color: Colors.amberAccent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 45,
                        height: 45,
                        child: Icon(Icons.laptop_mac, color: Colors.amber),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Elektronik",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 44, 44),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 101, 101, 101),
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber.withValues(alpha: 0.25),
                          border: Border.all(color: Colors.amberAccent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 45,
                        height: 45,
                        child: Icon(Icons.handyman, color: Colors.amber),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Instalasi",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 44, 44),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 101, 101, 101),
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber.withValues(alpha: 0.25),
                          border: Border.all(color: Colors.amberAccent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 45,
                        height: 45,
                        child: Icon(Icons.motorcycle, color: Colors.amber),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Motor",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
