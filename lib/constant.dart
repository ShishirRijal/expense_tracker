import 'package:flutter/material.dart';

const kBackgroundColor = Color(0XFFF3F4F6);
const kGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xff3CADE6),
    Color(0xff9A7BF6),
    Color(0xffC273FB),
    Color(0xffE07FCF),
    Color(0xffF6917B),
    Color(0xfff04911),
  ],
  stops: [0.01, 0.2, 0.4, 0.5, 0.6, 0.8],
);

const kActiveTextStyle = TextStyle(
  color: Colors.deepOrangeAccent,
  fontSize: 25.0,
  fontWeight: FontWeight.w600,
);
const kInactiveTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 16.0,
);
