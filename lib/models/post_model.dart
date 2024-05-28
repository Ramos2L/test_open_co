import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId'] ?? 0,
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  @override
  String toString() {
    return 'PostModel: $userId, id $id, title: $title, body $body';
  }

  @override
  List<Object?> get props => [userId, id, title, body];
}
