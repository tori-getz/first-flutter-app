import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/user_model.dart';
import 'package:flutter_first_app/pages/home_page.dart';
import 'package:flutter_first_app/pages/user_page.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/home':
          return MaterialPageRoute(builder: (context) => const HomePage());
        case '/user':
          User user = settings.arguments as User;
          return MaterialPageRoute(builder: (context) => UserPage(user: user));
      }
    },
  ));
}
