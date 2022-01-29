import 'package:flutter/material.dart';

class UnderLinedInputField extends StatelessWidget {
  const UnderLinedInputField(
      {Key? key, required this.controller, this.hintText, this.hideText})
      : super(key: key);
  final TextEditingController controller;
  final String? hintText;
  final bool? hideText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // textAlign: TextAlign.center,
      obscureText: hideText ?? false,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepOrange,
            width: 2.0,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      controller: controller,
    );
  }
}
