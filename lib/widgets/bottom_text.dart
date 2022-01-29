import 'package:expense_tracker/screens/login_screen.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText(
      {Key? key,
      required this.title,
      required this.text,
      required this.onPressed})
      : super(key: key);
  final String title;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
