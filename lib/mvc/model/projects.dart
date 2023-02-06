// To parse this JSON data, do
//
//     final projectList = projectListFromJson(jsonString);

import 'dart:convert';

List<Project> projectListFromJson(String str) => List<Project>.from(
    json.decode(str).map((x) => Project.fromJson(x)));

String projectListToJson(List<Project> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Project {
  Project({
    this.id,
    this.name,
    this.title,
    this.description,
    this.needAmount,
    this.zakat,
    this.fund,
    this.imagePath,
  });

  int? id;
  String? name;
  String? title;
  String? description;
  int? needAmount;
  String? zakat;
  int? fund;
  String? imagePath;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        description: json["description"],
        needAmount: json["need_amount"],
        zakat: json["zakat"],
        fund: json["fund"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title,
        "description": description,
        "need_amount": needAmount,
        "zakat": zakat,
        "fund": fund,
        "image_path": imagePath,
      };
}
