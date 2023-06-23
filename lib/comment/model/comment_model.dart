// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CommentModel {
  final String comment;
  final String imageUrl;
  bool isLast;
  CommentModel({
    required this.comment,
    required this.imageUrl,
    this.isLast = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': comment,
      'thumbnailUrl': imageUrl,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      comment: map['title'] as String,
      imageUrl: map['thumbnailUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
