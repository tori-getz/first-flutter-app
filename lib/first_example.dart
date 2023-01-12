import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
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
          title: const Text(
            'First Flutter App',
            style: TextStyle(fontFamily: 'Lobster'),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(color: Colors.purple[200]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  _isCool ? 'assets/images/tz.jpeg' : 'assets/images/pz.jpg',
                  width: 300,
                  height: 300),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
