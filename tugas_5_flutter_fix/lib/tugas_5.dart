import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtonDemoPage(),
    );
  }
}

class ButtonDemoPage extends StatefulWidget {
  const ButtonDemoPage({super.key});

  @override
  State<ButtonDemoPage> createState() => _ButtonDemoPageState();
}

class _ButtonDemoPageState extends State<ButtonDemoPage> {
  bool showSecretText = false;
  bool isFavorite = false;
  bool showDescription = false;
  bool showBoxText = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 5"), backgroundColor: Colors.blue),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter--;
          });
        },
        child: const Icon(Icons.remove),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showSecretText = !showSecretText;
                });
              },
              child: Text("Tampilkan Nama"),
            ),
            if (showSecretText)
              Text("Nama saya: Clara Angella", style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
            if (isFavorite) Text("Disukai!", style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                setState(() {
                  showDescription = !showDescription;
                });
              },
              child: Text("Lihat Selengkapnya"),
            ),
            if (showDescription)
              Text(
                "Clara Angella adalah siswi PPKD Jakarta Pusat jurusan App Developer",
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                setState(() {
                  showBoxText = !showBoxText;
                });
                print('Kotak berhasil disentuh!');
              },
              child: Container(
                height: 100,
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.lightBlueAccent,
                child: Text("Sentuh Kotak Ini", style: TextStyle(fontSize: 16)),
              ),
            ),
            if (showBoxText)
              Text("Kotak telah disentuh!", style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                setState(() {
                  counter += 1;
                });
                print("Ditekan sekali");
              },
              onDoubleTap: () {
                setState(() {
                  counter += 2;
                });
                print("Ditekan dua kali");
              },
              onLongPress: () {
                setState(() {
                  counter += 3;
                });
                print("Tahan lama");
              },
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.orangeAccent,
                child: const Text(
                  "Sentuh Area Ini (Tap, Double Tap, Long Press)",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Counter: $counter",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
