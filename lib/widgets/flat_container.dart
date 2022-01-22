import 'package:flutter/material.dart';

class FlatContainer extends StatelessWidget {
  const FlatContainer({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20.0),
          Icon(
            icon,
            size: 25.0,
            color: Colors.black54,
          ),
          const SizedBox(width: 20.0),
          Text(
            title,
            style: const TextStyle(color: Colors.black54, fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
