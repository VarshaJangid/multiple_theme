import 'package:flutter/material.dart';

import '../services/storage_manager.dart';

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

  // Dark Theme
  final darkTheme = ThemeData(
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

  // Green Theme
  final greenTheme = ThemeData(
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

  // Light Theme
  final lightTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(backgroundColor: Colors.blue),
    ),
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: const IconThemeData(color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.white54,
  );

  // Red Theme
  final redTheme = ThemeData(
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
