// To parse this JSON data, do
//
//     final postDetailsData = postDetailsDataFromJson(jsonString);

import 'dart:convert';

PostDetailsData postDetailsDataFromJson(String str) => PostDetailsData.fromJson(json.decode(str));

String postDetailsDataToJson(PostDetailsData data) => json.encode(data.toJson());

class PostDetailsData {
  int userId;
  int id;
  String title;
  String body;

  PostDetailsData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDetailsData.fromJson(Map<String, dynamic> json) => PostDetailsData(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
