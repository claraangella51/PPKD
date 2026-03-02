import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_6_flutter/halaman/masuk.dart';

class Awal extends StatelessWidget {
  const Awal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 32, left: 32, top: 72),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/tukangprobanget.png',
                  width: 200,
                  height: 200,
                ),
                Text(
                  'Selamat Datang di',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff11294e),
                  ),
                ),
                Text(
                  'TukangPro',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff11294e),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Solusi Cepat, Professional, Terpercaya',
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Masuk()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black, width: 2),
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(FeatherIcons.user, color: Colors.black, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'Masuk sebagai Pemakai Jasa',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff11294e),
                      side: BorderSide(color: Color(0xff11294e), width: 2),
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.handyman,
                          color: Colors.amberAccent,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Masuk sebagai Tukang',
                          style: TextStyle(color: Colors.amberAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
