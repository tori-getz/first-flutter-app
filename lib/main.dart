import 'package:flutter/material.dart';
import 'package:flutter_first_app/first_example.dart';

void main() {
  runApp(MaterialApp(
    home: MyFirstApp(),
  ));
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

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
          child: MaterialButton(
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (context) => SecondPage());
              Navigator.push(context, route);
            },
            child: const Text('жмякни чтоб перейти на другой экран'),
          ),
        ));
  }
}
