import 'package:tugas_9_flutter/models/modelday14.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<Welcome>> loadTarot() async {
  final String jsonString = await rootBundle.loadString(
    'assets/tarot-images.json',
  );

  return welcomeFromJson(jsonString);
}
