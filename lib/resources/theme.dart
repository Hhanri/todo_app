import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  textTheme: TextTheme(
    bodyText1: MyTextStyles.todoTitle,
    bodyText2: MyTextStyles.dateTitle
  ),
);

class MyTextStyles {

  static const TextStyle todoTitle = TextStyle(
    fontFamily: 'Sana',
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
      shadows: <Shadow>[
        Shadow(
          color: const Color(0x29000000),
          offset: Offset(2,3),
          blurRadius: 6,
        )
      ]
  );

  static const TextStyle dateTitle = TextStyle(
    fontFamily: 'Hirogano',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    shadows: <Shadow>[
      Shadow(
        color: const Color(0x29000000),
        offset: Offset(2,3),
        blurRadius: 6,
      )
    ]
  );

}

class MyShapes {
  static BorderRadiusGeometry circularBorders = BorderRadius.circular(8.0);
}

extension CardColor on DateTime{
  Color getCardColor() {
    if (DateTime.now().isAfter(this)) {
      return Colors.redAccent;
    } else {
      return Colors.white;
    }
  }
}

extension IconColor on DateTime{
  Color getIconColor() {
    if (DateTime.now().isAfter(this)) {
      return Colors.black;
    } else {
      return Colors.red;
    }
  }
}

extension DateColor on DateTime{
  Color getDateColor() {
    if (DateTime.now().isAfter(this)) {
      return Colors.grey.shade400;
    } else {
      return Colors.grey.shade600;
    }
  }
}