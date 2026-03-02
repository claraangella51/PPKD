import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Icon(FeatherIcons.home, size: 28, color: Colors.black),
          Text('love', style: GoogleFonts.poppins()),
        ],
      ),
    );
  }
}
