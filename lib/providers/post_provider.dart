import 'package:flutter_first_app/api/posts.dart';
import 'package:flutter_first_app/models/post.dart';

class PostProvider {
  List<Post> posts = [];

  Future<List<Post>> loadPosts() async {
    PostList response = await getPosts();
    return response.posts;
  }
}
