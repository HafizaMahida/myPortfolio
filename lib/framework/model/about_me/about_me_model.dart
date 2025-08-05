// To parse this JSON data, do
//
//     final aboutMe = aboutMeFromJson(jsonString);

import 'dart:convert';

AboutMe aboutMeFromJson(String str) => AboutMe.fromJson(json.decode(str));

String aboutMeToJson(AboutMe data) => json.encode(data.toJson());

class AboutMe {
  String? name;
  String? description;
  String? resume;

  AboutMe({
    this.name,
    this.description,
    this.resume,
  });

  factory AboutMe.fromJson(Map<String, dynamic> json) => AboutMe(
    name: json["name"],
    description: json["description"],
    resume: json["resume"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "resume": resume,
  };
}
