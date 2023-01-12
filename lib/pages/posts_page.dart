import 'package:flutter/material.dart';
import 'package:flutter_first_app/api/posts.dart';
import 'package:flutter_first_app/models/post.dart';
import 'package:flutter_first_app/widgets/counter.dart';

class PostsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostsPageState();
  }
}

class _PostsPageState extends State<PostsPage> {
  late Future<PostList>? _postList;

  @override
  void initState() {
    _postList = getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Посты'),
        ),
        body: FutureBuilder<PostList>(
          future: _postList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            if (snapshot.hasData) {
              return ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data!.posts.length,
                itemBuilder: (context, index) {
                  Post item = snapshot.data!.posts[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: Image.network('https://picsum.photos/100/100'),
                        title: Text(item.title),
                        subtitle: Text(item.body),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Counter(
                            icon: Icons.favorite,
                            backgroundColor: Colors.red[300] as Color,
                            tintColor: Colors.white,
                            amount: item.reactions,
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/comments',
                                  arguments: item.id);
                            },
                            child: Counter(
                              icon: Icons.comment,
                              backgroundColor: Colors.grey[350] as Color,
                              tintColor: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      )
                    ],
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
