// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String? name;
  String? number;
  String? arcana;
  String? suit;
  String? img;
  List<String>? fortuneTelling;
  List<String>? keywords;
  Meanings? meanings;
  String? archetype;
  String? hebrewAlphabet;
  String? numerology;
  String? elemental;
  String? mythicalSpiritual;
  List<String>? questionsToAsk;

  Welcome({
    this.name,
    this.number,
    this.arcana,
    this.suit,
    this.img,
    this.fortuneTelling,
    this.keywords,
    this.meanings,
    this.archetype,
    this.hebrewAlphabet,
    this.numerology,
    this.elemental,
    this.mythicalSpiritual,
    this.questionsToAsk,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["name"],
    number: json["number"],
    arcana: json["arcana"],
    suit: json["suit"],
    img: json["img"],
    fortuneTelling: json["fortune_telling"] == null
        ? []
        : List<String>.from(json["fortune_telling"]!.map((x) => x)),
    keywords: json["keywords"] == null
        ? []
        : List<String>.from(json["keywords"]!.map((x) => x)),
    meanings: json["meanings"] == null
        ? null
        : Meanings.fromJson(json["meanings"]),
    archetype: json["Archetype"],
    hebrewAlphabet: json["Hebrew Alphabet"],
    numerology: json["Numerology"],
    elemental: json["Elemental"],
    mythicalSpiritual: json["Mythical/Spiritual"],
    questionsToAsk: json["Questions to Ask"] == null
        ? []
        : List<String>.from(json["Questions to Ask"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "number": number,
    "arcana": arcana,
    "suit": suit,
    "img": img,
    "fortune_telling": fortuneTelling == null
        ? []
        : List<dynamic>.from(fortuneTelling!.map((x) => x)),
    "keywords": keywords == null
        ? []
        : List<dynamic>.from(keywords!.map((x) => x)),
    "meanings": meanings?.toJson(),
    "Archetype": archetype,
    "Hebrew Alphabet": hebrewAlphabet,
    "Numerology": numerology,
    "Elemental": elemental,
    "Mythical/Spiritual": mythicalSpiritual,
    "Questions to Ask": questionsToAsk == null
        ? []
        : List<dynamic>.from(questionsToAsk!.map((x) => x)),
  };
}

class Meanings {
  List<String>? light;
  List<String>? shadow;

  Meanings({this.light, this.shadow});

  factory Meanings.fromJson(Map<String, dynamic> json) => Meanings(
    light: json["light"] == null
        ? []
        : List<String>.from(json["light"]!.map((x) => x)),
    shadow: json["shadow"] == null
        ? []
        : List<String>.from(json["shadow"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "light": light == null ? [] : List<dynamic>.from(light!.map((x) => x)),
    "shadow": shadow == null ? [] : List<dynamic>.from(shadow!.map((x) => x)),
  };
}
