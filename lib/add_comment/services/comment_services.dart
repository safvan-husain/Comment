import 'dart:convert';

import 'package:comment/add_comment/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentServices {
  final http.Client client;

  CommentServices({required this.client});

  Future<List<CommentModel>> fetchComments() async {
    late List<CommentModel> comments;

    Uri uri = Uri.https('jsonplaceholder.typicode.com', '/photos');
    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    try {
      http.Response response = await client.get(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);
        comments = decodedResponse.map((element) {
          return CommentModel.fromMap(element);
        }).toList();
      }
      return comments;
    } catch (e) {
      return comments;
    }
  }

  Future<CommentModel?> postComment({required String title}) async {
    late CommentModel comment;

    Uri uri = Uri.https('jsonplaceholder.typicode.com', '/photos');
    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    try {
      http.Response response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode({
          "title": title,
          'thumbnailUrl':
              'https://www.google.com/s2/favicons?sz=64&domain_url=yahoo.com',
          'url': 'https://yahoo.com/',
        }),
      );
      if (response.statusCode == 201) {
        comment = CommentModel.fromJson(response.body);
      }
      return comment;
    } catch (e) {
      return null;
    }
  }
}
