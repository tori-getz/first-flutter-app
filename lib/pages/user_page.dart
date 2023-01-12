import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/user_model.dart';

class UserPage extends StatelessWidget {
  late User user;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
        padding: EdgeInsets.all(10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)));

    RouteSettings settings = ModalRoute.of(context)!.settings;
    user = settings.arguments as User;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(user.name),
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(user.image),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: buttonStyle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.keyboard_arrow_left),
                    SizedBox(width: 4),
                    Text('Назад'),
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
