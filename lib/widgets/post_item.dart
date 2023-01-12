import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/post.dart';
import 'package:flutter_first_app/widgets/counter.dart';

class PostItem extends StatelessWidget {
  final Post item;
  final VoidCallback onPressed;

  const PostItem({super.key, required this.item, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.network('https://picsum.photos/100/100'),
          title: Text(item.title),
          subtitle: Text(item.body),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Counter(
              icon: Icons.favorite,
              backgroundColor: Colors.red[300] as Color,
              tintColor: Colors.white,
              amount: item.reactions,
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: onPressed,
              child: Counter(
                icon: Icons.comment,
                backgroundColor: Colors.grey[350] as Color,
                tintColor: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
          ],
        )
      ],
    );
  }
}
