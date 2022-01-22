import 'package:flutter/material.dart';

class CatergoryItem extends StatelessWidget {
  const CatergoryItem(
      {Key? key,
      required this.title,
      required this.amount,
      required this.imageAddress})
      : super(key: key);
  final String title;
  final int amount;
  final String imageAddress;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0,
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(imageAddress),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Column(
            children: [
              Text(
                "\$$amount",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                ),
              ),
              const Text(
                "Today",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
