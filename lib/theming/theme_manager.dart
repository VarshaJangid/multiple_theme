import 'package:flutter/material.dart';

import '/services/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = ThemeData();

  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ---- $value');
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else if (themeMode == 'dark') {
        _themeData = darkTheme;
      } else if (themeMode == 'red') {
        _themeData = redTheme;
      } else {
        _themeData = greenTheme;
      }
      notifyListeners();
    });
  }

  final darkTheme = ThemeData(
    textTheme: const TextTheme(
      headline2: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(color: Colors.white, fontSize: 18),
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: Colors.black),
    ),
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    iconTheme: const IconThemeData(color: Colors.white),
  );

  final greenTheme = ThemeData(
    dialogBackgroundColor: Colors.green,
    textTheme: const TextTheme(
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      headline2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(color: Colors.white, fontSize: 18),
    ),
    scaffoldBackgroundColor: Colors.green.shade50,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: Colors.green),
    ),
    primarySwatch: Colors.green,
    backgroundColor: Colors.green,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    iconTheme: const IconThemeData(color: Colors.green),
  );

  final lightTheme = ThemeData(
    dialogBackgroundColor: Colors.blue,
    textTheme: const TextTheme(
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(color: Colors.white, fontSize: 18),
    ),
    scaffoldBackgroundColor: Colors.blue.shade50,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: Colors.blue),
    ),
    primarySwatch: Colors.blue,
    backgroundColor: Colors.blue,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    iconTheme: const IconThemeData(color: Colors.blue),
  );

  final redTheme = ThemeData(
    dialogBackgroundColor: Colors.red,
    textTheme: const TextTheme(
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(color: Colors.white, fontSize: 18),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: Colors.red),
    ),
    scaffoldBackgroundColor: Colors.red.shade100,
    primarySwatch: Colors.red,
    primaryColor: Colors.red,
    backgroundColor: Colors.red,
    iconTheme: const IconThemeData(color: Colors.red),
    accentColor: Colors.red,
    accentIconTheme: const IconThemeData(color: Colors.red),
    dividerColor: Colors.red,
  );

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }

  void setRedMode() async {
    _themeData = redTheme;
    StorageManager.saveData('themeMode', 'red');
    notifyListeners();
  }

  void setGreenMode() async {
    _themeData = greenTheme;
    StorageManager.saveData('themeMode', 'green');
    notifyListeners();
  }
}
