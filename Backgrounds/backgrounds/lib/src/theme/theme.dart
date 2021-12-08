import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme;

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;

  ThemeData get currentTheme => _currentTheme;

  /// constructor
  ThemeChanger(int theme) {
    switch (theme) {

      /// Light
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light()
            .copyWith(colorScheme: ColorScheme.light(secondary: Colors.pink));
        break;

      /// dark
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      /// custom
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          secondary: Color(0xff48A0EB),
        ),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
