import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    //brightness: Brightness.dark,
    primaryColor: Colors.blue.shade300,
    textTheme: const TextTheme(
        bodyText1: MyTextStyles.todoTitle,
        bodyText2: MyTextStyles.dateTitle
    ),
  );

  static final lighTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    //colorScheme: ColorScheme.light(),
    //brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: const TextTheme(
        bodyText1: MyTextStyles.todoTitle,
        bodyText2: MyTextStyles.dateTitle
    ),
  );
}

class MyTextStyles {

  static const TextStyle todoTitle = TextStyle(
    fontFamily: 'Sana',
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
      shadows: <Shadow>[
        Shadow(
          color: Color(0x29000000),
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
        color: Color(0x29000000),
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
  Color? getCardColor() {
    if (DateTime.now().isAfter(this)) return Colors.redAccent;
    return null;
  }
}

extension IconColor on DateTime{
  Color? getIconColor() {
    if (DateTime.now().isAfter(this)) {
      return Colors.black;
    }
    return null;
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