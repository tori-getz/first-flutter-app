import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/post.dart';
import 'package:flutter_first_app/routes/routes.dart';
import 'package:flutter_first_app/widgets/post_item.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostsPageState();
  }
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _renderPosts(BuildContext context, List<Post> posts, Widget? _) {
    if (posts.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        Post post = posts[index];

        return PostItem(
          item: post,
          onPressed: () {
            Navigator.pushNamed(context, commentsPageRoute, arguments: post.id);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Посты'),
      ),
      body: Consumer<List<Post>>(
        builder: _renderPosts,
      ),
    );
  }
}
