import 'dart:convert';

import 'package:flutter_first_app/models/comment.dart';
import 'package:flutter_first_app/models/post.dart';
import 'package:http/http.dart' as http;

Future<PostList> getPosts() async {
  Uri uri = Uri.https('dummyjson.com', 'posts');
  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('Error: ${response.reasonPhrase}');
  }

  return PostList.fromJson(json.decode(response.body));
}

Future<CommentList> getPostComments(int postId) async {
  Uri uri = Uri.http('dummyjson.com', 'posts/$postId/comments');
  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('Error: ${response.reasonPhrase}');
  }

  return CommentList.fromJson(json.decode(response.body));
}
