import 'package:flutter/material.dart';

enum ThemeType { Dark, Light }

class ThemeModel extends ChangeNotifier {
  Color? _tempPrimaryMainColor;
  ColorSwatch? _tempAccentColor;
  ColorSwatch? _tempScaffoldColor;
  ColorSwatch? _tempTextColor;
  ColorSwatch? _tempAppbarColor;
  ColorSwatch? _tempDividerColor;
  Color _scaffoldColor = Colors.grey;
  Color? colorChoosenColor;
  String? _colorChoosed;
  static AppBarTheme? appBarTheme1;
  ColorSwatch _accentColor = Colors.orange;
  Color _textColor = Colors.brown;
  Color? _currentColor;
  Color _pickerColor = Colors.red;
  Color? _primaryTempShadeColor;
  Color? _accentTempShadeColor;
  Color? _scaffoldTempShadeColor;
  Color? _textTempShadeColor;
  Color? _appbarTempShadeColor;
  Color? _dividerTempShadeColor;
  Color _primaryShadeColor = Colors.cyan.shade800;
  Color _accentShadeColor = Colors.amber;
  Color _appbarShadeColor = Colors.cyan.shade500;
  Color _dividerShadeColor = Colors.grey.shade800;
  Color _textShadeColor = Colors.blue.shade800;
  Color _scaffoldShadeColor = Colors.blue.shade800;
  Color _primaryMainColor = Colors.cyan;
  Color _appbarColor = Colors.blue;
  ColorSwatch _dividerColor = Colors.grey;

  //getters
  Color? get appbarTempShadeColor => _appbarTempShadeColor;

  Color? get textTempShadeColor => _textTempShadeColor;

  Color get scaffoldColor => _scaffoldColor;

  Color get accentShadeColor => _accentShadeColor;

  Color? get scaffoldTempShadeColor => _scaffoldTempShadeColor;

  Color get appbarcolor => _appbarColor;

  Color get scaffoldShadeColor => _scaffoldShadeColor;

  Color? get accentTempShadeColor => _accentTempShadeColor;

  ColorSwatch? get tempScaffoldColor => _tempScaffoldColor;

  Color? get primaryTempShadeColor => _primaryTempShadeColor;

  Color? get tempPrimaryMainColor => _tempPrimaryMainColor;

  Color get primaryShadeColor => _primaryShadeColor;

  ColorSwatch get accentColor => _accentColor;

  Color get primaryMainColor => _primaryMainColor;

  get pickerColor => _pickerColor;

  get currentColor => _currentColor;

  get colorChoosed => _colorChoosed;

  ColorSwatch? get tempDividerColor => _tempDividerColor;

  ColorSwatch? get tempAppbarColor => _tempAppbarColor;

  Color get textColor => _textColor;

  ColorSwatch? get tempAccentColor => _tempAccentColor;

  ColorSwatch get dividerColor => _dividerColor;

  ColorSwatch? get tempTextColor => _tempTextColor;

  Color get dividerShadeColor => _dividerShadeColor;

  Color get appbarShadeColor => _appbarShadeColor;

  Color get textShadeColor => _textShadeColor;

  Color? get dividerTempShadeColor => _dividerTempShadeColor;

  //setters

  setDividerTempShadeColor(Color value) {
    _dividerTempShadeColor = value;
    notifyListeners();
  }

  setTextShadeColor(Color value) {
    _textShadeColor = value;
    notifyListeners();
  }

  setDividerShadeColor(Color value) {
    _dividerShadeColor = value;
    notifyListeners();
  }

  setAppbarShadeColor(Color value) {
    _appbarShadeColor = value;
    notifyListeners();
  }

  setAppbarTempShadeColor(Color value) {
    _appbarTempShadeColor = value;
    notifyListeners();
  }

  setTextTempShadeColor(Color value) {
    _textTempShadeColor = value;
    notifyListeners();
  }

  setDividerColor(ColorSwatch value) {
    _dividerColor = value;
    notifyListeners();
  }

  setTextColor(Color value) {
    _textColor = value;
    notifyListeners();
  }

  setTempAccentColor(ColorSwatch value) {
    _tempAccentColor = value;
    notifyListeners();
  }

  setTempTextColor(ColorSwatch value) {
    _tempTextColor = value;
    notifyListeners();
  }

  setTempAppbarColor(ColorSwatch value) {
    _tempAppbarColor = value;
    print('setTempAppbarColor');
    notifyListeners();
  }

  setTempDividerColor(ColorSwatch value) {
    _tempDividerColor = value;
    notifyListeners();
  }

  setScaffoldShadeColor(Color value) {
    _scaffoldShadeColor = value;
    notifyListeners();
  }

  setTempScaffoldColor(ColorSwatch value) {
    _tempScaffoldColor = value;
    notifyListeners();
  }

  setAccentTempShadeColor(Color value) {
    _accentTempShadeColor = value;
    notifyListeners();
  }

  setTempShadeColor(Color value) {
    _primaryTempShadeColor = value;
    notifyListeners();
  }

  setPrimaryShadeColor(Color value) {
    _primaryShadeColor = value;
    notifyListeners();
  }

  setTempPrimaryMainColor(Color value) {
    _tempPrimaryMainColor = value;
    notifyListeners();
  }

  setAccentColor(ColorSwatch value) {
    _accentColor = value;
    notifyListeners();
  }

  setPrimaryMainColor(Color value) {
    _primaryMainColor = value;
    notifyListeners();
  }

  set currentColor(value) {
    _currentColor = value;
    notifyListeners();
  }

  set colorChoosed(value) {
    _colorChoosed = value;
    notifyListeners();
  }

  set pickerColor(value) {
    _pickerColor = value;
    notifyListeners();
  }

  setScaffoldTempShadeColor(Color value) {
    _scaffoldTempShadeColor = value;
    notifyListeners();
  }

  setAccentShadeColor(Color value) {
    _accentShadeColor = value;
    notifyListeners();
  }

  setScaffoldColor(ColorSwatch value) {
    _scaffoldColor = value;
    notifyListeners();
  }

  setAppbarColor(Color value) {
    _appbarColor = value;
    notifyListeners();
  }
}
