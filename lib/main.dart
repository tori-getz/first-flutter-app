import 'package:flutter/material.dart';
import 'package:flutter_first_app/pages/add_user_page.dart';
import 'package:flutter_first_app/pages/home_page.dart';
import 'package:flutter_first_app/pages/user_page.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    initialRoute: '/home',
    routes: {
      '/home': (context) => const HomePage(),
      '/user': (context) => UserPage(),
      '/adduser': (context) => AddUserPage()
    },
  ));
}
