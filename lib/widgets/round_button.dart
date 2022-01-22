import 'package:flutter/material.dart';

import '../constant.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.onClick})
      : super(key: key);
  final String title;
  final bool isSelected;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              gradient: kGradient,
              borderRadius: BorderRadius.circular(30.0),
            )
          : BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 10.0,
          ),
          child: Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.deepOrange,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: onClick,
      ),
    );
  }
}
