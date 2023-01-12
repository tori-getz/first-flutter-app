import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/user.dart';

class UserButton extends StatelessWidget {
  final VoidCallback onPressed;
  final User user;

  const UserButton({super.key, required this.onPressed, required this.user});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = OutlinedButton.styleFrom(
        padding: EdgeInsets.all(10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)));

    return OutlinedButton(
      onPressed: onPressed,
      style: style,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            foregroundImage: Image.network(user.image).image,
            backgroundColor: Colors.grey[600],
          ),
          Text(user.name),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
