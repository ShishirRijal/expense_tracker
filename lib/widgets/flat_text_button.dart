import 'package:flutter/material.dart';

class FlatTextButton extends StatelessWidget {
  const FlatTextButton({Key? key, required this.title, required this.onClick})
      : super(key: key);
  final String title;

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 10.0,
          ),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: onClick,
      ),
    );
  }
}
