import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class Beranda extends StatefulWidget {
  @override
  State<Beranda> createState() => _HomePageState();
}

class _HomePageState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 11 / 7,
                ),
                items: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 8,
                          offset: Offset(0, 10),
                          spreadRadius: 8,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/ilham.png',
                                width: double.infinity,
                                height: 180,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                left: 8,
                                bottom: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Diskon 25% Jasa Cuci AC',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'untuk pelanggan baru',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff11294e),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    top: 24,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ilham Wijaya K',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                            size: 15,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            '4.8',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 28),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff11294e),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      'Pesan',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 8,
                          offset: Offset(0, 10),
                          spreadRadius: 8,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/ali.png',
                                width: double.infinity,
                                height: 180,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                left: 8,
                                bottom: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gratis Ganti Oli',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'min. belanja 300 ribu',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff11294e),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    top: 24,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ali Rahman H',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                            size: 15,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            '4.8',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 28),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff11294e),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      'Pesan',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 8,
                          offset: Offset(0, 10),
                          spreadRadius: 8,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/husain.png',
                                width: double.infinity,
                                height: 180,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                left: 8,
                                bottom: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Diskon Setengah Harga',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'instalasi CCTV',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff11294e),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    top: 24,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Husain Nuh',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                            size: 15,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            '4.9',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 28),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff11294e),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      'Pesan',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 32, right: 32, top: 4),
              child: Row(
                children: [
                  Text(
                    'Layanan',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GridView.count(crossAxisCount: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
