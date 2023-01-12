import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  late bool _isCool;

  @override
  void initState() {
    _isCool = true;
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First Flutter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isCool
                  ? const Text('Санчез и Гец крутотятки и котятки')
                  : const Text('Санчез и гец чето так се('),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _isCool = !_isCool;
                  });
                },
                child: const Text('Плиз, нажми на меня'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
