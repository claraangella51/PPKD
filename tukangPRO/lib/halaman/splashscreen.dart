import 'package:flutter/material.dart';
import 'package:tugas_6_flutter/halaman/beranda.dart';
import 'package:tugas_6_flutter/halaman/masuk.dart';
import 'package:tugas_6_flutter/database/preference.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    bool? data = await PreferenceHandler.getIsLogin();
    print(data);
    print("Hai!");
    if (data == true) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Beranda()),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Masuk()),
        (route) => false,
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            "assets/images/tukangprobanget.png",
            height: 300,
            width: 300,
          ),
        ),
      ),
    );
  }
}
