import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_first_app/api/users.dart';
import 'package:flutter_first_app/models/user.dart';
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
    super.initState();
    getUsers().then((users) {
      setState(() {
        _users = users;
      });
    });
  }

  void _addUserCallback() async {
    User newUser = await Navigator.pushNamed(context, '/adduser') as User;
    setState(() {
      _users.add(newUser);
    });
  }

  void _showAppInfo() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Инфа о приложении'),
            content:
                const Text("""Лучшее приложение, какое было сделанно на Flutter.
                Оно было воссоздано разработчиком tori-getz!
                Скиньте на пиво кст"""),
            actions: [
              MaterialButton(
                  child: const Text('Ок, понял'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle addButtonStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)));

    final ButtonStyle infoButtonStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.all(10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)));

    final ButtonStyle postsButtonStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.pink[200],
        padding: const EdgeInsets.all(10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)));

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter example app',
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            ..._users.map((user) {
              return Column(
                children: [
                  UserButton(
                    user: user,
                    onPressed: () {
                      Navigator.pushNamed(context, '/user', arguments: user);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            }).toList(),
            const SizedBox(height: 32),
            ElevatedButton(
              style: addButtonStyle,
              onPressed: _addUserCallback,
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
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: infoButtonStyle,
              onPressed: _showAppInfo,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.info_outline_rounded),
                  SizedBox(
                    width: 4,
                  ),
                  Text('Информация о приложении')
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: postsButtonStyle,
              onPressed: () {
                Navigator.pushNamed(context, '/posts');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.newspaper),
                  SizedBox(
                    width: 4,
                  ),
                  Text('Посты')
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ));
  }
}
