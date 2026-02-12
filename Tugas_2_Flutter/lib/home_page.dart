import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Soal Nomor 1
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Founder of Fix It'),
        centerTitle: true,
      ),
      body:
          // Soal Nomor 2 sampai 7 dibungkus dalam Column
          // Dan karena Text harus dibungkus center seperti yang diminta soal,
          // maka saya menggunakan Center pada setiap container
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Soal Nomor 2
              Center(
                child: Text(
                  'Clara Angella Harsono',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child:
                    // Soal Nomor 3
                    Container(
                      height: 130,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amberAccent),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Contact Information',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.email, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                'claraangella51@gmail.com',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, color: Colors.green),
                              SizedBox(width: 10),
                              Text(
                                '+62 812-3456-7890',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.web, color: Colors.purple),
                              SizedBox(width: 10),
                              Text(
                                'www.claraangella.com',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              ),
              Center(
                child:
                    // Soal Nomor 4
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amberAccent),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.redAccent),
                          Spacer(flex: 1),
                          Icon(Icons.favorite, color: Colors.pinkAccent),
                          Spacer(flex: 2),
                          Icon(Icons.favorite, color: Colors.purpleAccent),
                        ],
                      ),
                    ),
              ),
              Center(
                child: Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amberAccent),
                  ),

                  // Soal Nomor 5
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.favorite, color: Colors.redAccent),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.favorite, color: Colors.pinkAccent),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.purpleAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child:
                    // Soal Nomor 6
                    Container(
                      height: 90,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Clara Angella Harsono adalah pendiri Fix It\n'
                        'Ia ingin ikut andil dalam mewujudkan SDGs\n'
                        'terutama nomor 8, 9, 11.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
              ),
              Center(
                child:
                    // Soal Nomor 7
                    Container(
                      height: 200,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amberAccent),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                        image: DecorationImage(
                          image: AssetImage('assets/images/fixit.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
              ),
            ],
          ),
    );
  }
}
