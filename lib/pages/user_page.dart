import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/user_model.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(user.name),
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
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.keyboard_arrow_left),
                    Text('Назад')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
