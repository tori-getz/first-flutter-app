import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/user_model.dart';

class UserButton extends StatelessWidget {
  final VoidCallback onPressed;
  final User user;

  const UserButton({super.key, required this.onPressed, required this.user});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.name),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
