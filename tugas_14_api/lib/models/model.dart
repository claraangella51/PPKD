// To parse this JSON data, do
//
//     final getChar = getCharFromJson(jsonString);

import 'dart:convert';

GetChar getCharFromJson(String str) => GetChar.fromJson(json.decode(str));

String getCharToJson(GetChar data) => json.encode(data.toJson());

class GetChar {
  Info? info;
  List<Result>? results;

  GetChar({this.info, this.results});

  factory GetChar.fromJson(Map<String, dynamic> json) => GetChar(
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
    results: json["results"] == null
        ? []
        : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info?.toJson(),
    "results": results == null
        ? []
        : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Info {
  int? count;
  int? pages;
  String? nextPage;
  dynamic prevPage;

  Info({this.count, this.pages, this.nextPage, this.prevPage});

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    nextPage: json["next_page"],
    prevPage: json["prev_page"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next_page": nextPage,
    "prev_page": prevPage,
  };
}

class Result {
  int? id;
  String? name;
  String? img;
  List<String>? alias;
  List<String>? species;
  String? gender;
  dynamic age;
  String? height;
  List<Relative>? relatives;
  String? birthplace;
  String? residence;
  String? status;
  String? occupation;
  List<Group>? groups;
  List<String>? roles;
  List<String>? episodes;

  Result({
    this.id,
    this.name,
    this.img,
    this.alias,
    this.species,
    this.gender,
    this.age,
    this.height,
    this.relatives,
    this.birthplace,
    this.residence,
    this.status,
    this.occupation,
    this.groups,
    this.roles,
    this.episodes,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    img: json["img"],
    alias: json["alias"] == null
        ? []
        : List<String>.from(json["alias"]!.map((x) => x)),
    species: json["species"] == null
        ? []
        : List<String>.from(json["species"]!.map((x) => x)),
    gender: json["gender"],
    age: json["age"],
    height: json["height"],
    relatives: json["relatives"] == null
        ? []
        : List<Relative>.from(
            json["relatives"]!.map((x) => Relative.fromJson(x)),
          ),
    birthplace: json["birthplace"],
    residence: json["residence"],
    status: json["status"],
    occupation: json["occupation"],
    groups: json["groups"] == null
        ? []
        : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
    roles: json["roles"] == null
        ? []
        : List<String>.from(json["roles"]!.map((x) => x)),
    episodes: json["episodes"] == null
        ? []
        : List<String>.from(json["episodes"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "img": img,
    "alias": alias == null ? [] : List<dynamic>.from(alias!.map((x) => x)),
    "species": species == null
        ? []
        : List<dynamic>.from(species!.map((x) => x)),
    "gender": gender,
    "age": age,
    "height": height,
    "relatives": relatives == null
        ? []
        : List<dynamic>.from(relatives!.map((x) => x.toJson())),
    "birthplace": birthplace,
    "residence": residence,
    "status": status,
    "occupation": occupation,
    "groups": groups == null
        ? []
        : List<dynamic>.from(groups!.map((x) => x.toJson())),
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
    "episodes": episodes == null
        ? []
        : List<dynamic>.from(episodes!.map((x) => x)),
  };
}

class Group {
  String? name;
  List<String>? subGroups;

  Group({this.name, this.subGroups});

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    name: json["name"],
    subGroups: json["sub_groups"] == null
        ? []
        : List<String>.from(json["sub_groups"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "sub_groups": subGroups == null
        ? []
        : List<dynamic>.from(subGroups!.map((x) => x)),
  };
}

class Relative {
  String? family;
  List<String>? members;

  Relative({this.family, this.members});

  factory Relative.fromJson(Map<String, dynamic> json) => Relative(
    family: json["family"],
    members: json["members"] == null
        ? []
        : List<String>.from(json["members"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "family": family,
    "members": members == null
        ? []
        : List<dynamic>.from(members!.map((x) => x)),
  };
}
