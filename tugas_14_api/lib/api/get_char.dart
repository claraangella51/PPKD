import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tugas_14_api/models/model.dart';

Future<GetChar> getChars() async {
  final response = await http.get(
    Uri.parse("https://api.attackontitanapi.com/characters"),
  );

  log(response.body);
  if (response.statusCode == 200) {
    return getCharFromJson(response.body);
  } else {
    throw Exception("Gagal memuat data");
  }
}
