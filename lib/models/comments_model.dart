import 'dart:convert';

import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      postId: json['postId'] ?? 0,
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      body: json['body'] ?? '',
    );
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      postId: map['postId'] ?? 0,
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  @override
  String toString() {
    return 'CommentsModel: $postId, id $id, name: $name, email $email, body $body';
  }

  @override
  List<Object?> get props => [postId, id, name, email, body];
}
