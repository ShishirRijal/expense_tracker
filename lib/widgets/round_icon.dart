import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  const RoundIcon({Key? key, required this.icon, required this.color})
      : super(key: key);
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: const Color(
          0xfff0f0f0,
        ),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
