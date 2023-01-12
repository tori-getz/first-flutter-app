import 'package:flutter/material.dart';
import 'package:flutter_first_app/user_model.dart';

class SecondPage extends StatelessWidget {
  final User user;

  const SecondPage({super.key, required this.user});

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'User info',
            style: TextStyle(fontFamily: 'Lobster'),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(user.image),
              ),
              Text(user.name),
            ],
          ),
        ),
      ),
    );
  }
}
