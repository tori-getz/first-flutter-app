import 'package:flutter/material.dart';
import 'package:flutter_first_app/second_page.dart';
import 'package:flutter_first_app/user_model.dart';

void main() {
  runApp(MaterialApp(
    home: MyFirstApp(),
  ));
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  Widget _userButton(BuildContext context, {required User user}) {
    return ElevatedButton(
      onPressed: () {
        Route route =
            MaterialPageRoute(builder: (context) => SecondPage(user: user));
        Navigator.push(context, route);
      },
      child: Text('Нажми, чтоб увидеть пользователя "${user.name}"'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'First Flutter App',
            style: TextStyle(fontFamily: 'Lobster'),
          ),
        ),
        body: Center(
            child: Column(
          children: [
            _userButton(context,
                user: User(image: 'assets/images/pz.jpg', name: 'Санька')),
            _userButton(context,
                user: User(image: 'assets/images/tz.jpeg', name: 'Гецуля'))
          ],
        )));
  }
}
