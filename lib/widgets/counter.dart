import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color tintColor;
  late int? amount;

  Counter({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.tintColor,
    this.amount,
  });

  Widget _renderAmount() {
    if (amount != null) {
      return Text(
        amount.toString(),
        style: TextStyle(
          color: tintColor,
          fontSize: 20,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: tintColor,
              size: 27,
            ),
            const SizedBox(width: 4),
            _renderAmount(),
          ],
        ));
  }
}
