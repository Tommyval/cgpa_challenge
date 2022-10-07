import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier {
  bool _darktheme = true;
  SharedPreferences? _preferences;
  bool get darktheme => _darktheme;

  ThemeSettings() {
    _loadSettingsfromprefs();
  }
  _initializeprefs() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  _loadSettingsfromprefs() async {
    await _initializeprefs();
    _darktheme = _preferences?.getBool('darktheme') ?? false;
    notifyListeners();
  }

  _saveSettingsFromPrefs() async {
    await _initializeprefs();
    _preferences?.setBool('darktheme', _darktheme);
  }

  void toggletheme() {
    _darktheme = !_darktheme;
    _saveSettingsFromPrefs();
    notifyListeners();
  }
}
