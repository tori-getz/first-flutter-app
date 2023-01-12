import 'package:flutter/material.dart';
import 'package:flutter_first_app/api/posts.dart';
import 'package:flutter_first_app/models/comment.dart';
import 'dart:math' as math;

class CommentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommentsPageState();
  }
}

class _CommentsPageState extends State<CommentsPage> {
  late Future<CommentList> _commentList;
  late String _title;

  @override
  void initState() {
    super.initState();
    _title = 'Загрузка...';
  }

  @protected
  void didChangeDependencies() {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    int postId = settings.arguments as int;
    _commentList = getPostComments(postId);
    _commentList.then((commentList) {
      setState(() {
        _title = 'Комментарии (${commentList.comments.length})';
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: FutureBuilder<CommentList>(
        future: _commentList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error.toString()}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.comments.length,
              itemBuilder: (context, index) {
                Comment comment = snapshot.data!.comments[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                    child: Text(
                        comment.user.username.substring(0, 2).toUpperCase()),
                  ),
                  title: Text(comment.user.username),
                  subtitle: Text(comment.body),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
