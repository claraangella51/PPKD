import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDDAED3),
        title: Text('Day 5 Scaffold Example'),
        centerTitle: true,
        actions: [Text('Hello')],
      ),
      body: Center(child: Text('Aku Ella')),
    );
  }
}
