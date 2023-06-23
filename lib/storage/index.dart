import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Storage {
  static Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static const String _themeColorKey = 'THEME_COLOR_KEY';

  static Future<bool> setThemeColor(Color themeColor) async {
    return await (await _getInstance())
        .setInt(_themeColorKey, themeColor.value);
  }

  static Future<Color> getThemeColor() async {
    int? value = (await _getInstance()).getInt(_themeColorKey);
    if (value == null) {
      return Colors.blue;
    }
    return Color(value);
  }
}
