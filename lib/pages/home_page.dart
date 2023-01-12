import 'package:flutter/material.dart';
import 'package:flutter_first_app/data/users.dart';
import 'package:flutter_first_app/models/user_model.dart';
import 'package:flutter_first_app/widgets/user_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Widget> _getUsersList(BuildContext context) {
    List<Widget> list = [];

    for (User user in users) {
      list.add(UserButton(
        user: user,
        onPressed: () {
          Navigator.pushNamed(context, '/user', arguments: user);
        },
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'First Flutter App',
          ),
        ),
        body: Center(
            child: Column(
          children: _getUsersList(context),
        )));
  }
}
