import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_first_app/data/users.dart';
import 'package:flutter_first_app/models/user_model.dart';
import 'package:flutter_first_app/widgets/user_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<User> _users = [];

  void initState() {
    _users = users;
  }

  List<Widget> _getUsersList(BuildContext context) {
    List<Widget> list = [];

    for (User user in users) {
      list.add(UserButton(
        user: user,
        onPressed: () {
          Navigator.pushNamed(context, '/user', arguments: user);
        },
      ));
      list.add(const SizedBox(height: 16));
    }

    return list;
  }

  void _addUserCallback(BuildContext context) async {
    final newUser = await Navigator.pushNamed(context, '/adduser');
    print(newUser.toString());
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle submitStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)));

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'First Flutter App',
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                ..._getUsersList(context),
                ElevatedButton(
                  style: submitStyle,
                  onPressed: () {
                    _addUserCallback(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Добавить пользователя')
                    ],
                  ),
                )
              ],
            )));
  }
}
