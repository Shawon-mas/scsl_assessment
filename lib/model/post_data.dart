// To parse this JSON data, do
//
//     final postData = postDataFromJson(jsonString);

import 'dart:convert';

List<PostData> postDataFromJson(String str) => List<PostData>.from(json.decode(str).map((x) => PostData.fromJson(x)));

String postDataToJson(List<PostData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostData {
  int userId;
  int id;
  String title;
  String body;

  PostData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
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

  Map<String, Object?> toMap() {
    return {
      "userId": userId,
      "id": id,
      "title": title,
      "body": body,
    };
  }
}
