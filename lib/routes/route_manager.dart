import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/user.dart';
import 'package:flutter_first_app/pages/add_user_page.dart';
import 'package:flutter_first_app/pages/comments_page.dart';
import 'package:flutter_first_app/pages/home_page.dart';
import 'package:flutter_first_app/pages/posts_page.dart';
import 'package:flutter_first_app/pages/user_page.dart';
import 'package:flutter_first_app/routes/routes.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      case userPageRoute:
        User user = settings.arguments as User;
        return MaterialPageRoute(builder: (context) => UserPage(user: user));

      case addUserPageRoute:
        return MaterialPageRoute(
          builder: (context) => AddUserPage(),
        );
        ;

      case postsPageRoute:
        return MaterialPageRoute(
          builder: (context) => PostsPage(),
        );

      case commentsPageRoute:
        int postId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => CommentsPage(postId: postId),
        );

      default:
        throw const FormatException('route not found! check routes again!');
    }
  }
}
