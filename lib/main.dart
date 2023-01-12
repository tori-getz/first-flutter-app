import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/post.dart';
import 'package:flutter_first_app/pages/add_user_page.dart';
import 'package:flutter_first_app/pages/comments_page.dart';
import 'package:flutter_first_app/pages/home_page.dart';
import 'package:flutter_first_app/pages/posts_page.dart';
import 'package:flutter_first_app/pages/user_page.dart';
import 'package:flutter_first_app/providers/post_provider.dart';
import 'package:flutter_first_app/routes/route_manager.dart';
import 'package:flutter_first_app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      FutureProvider<List<Post>>(
        initialData: const [],
        create: (_) async => await PostProvider().loadPosts(),
      )
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: homePageRoute,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
