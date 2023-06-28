import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Storage {
  static Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static const String _localeKey = 'LOCALE_KEY';

  static Future<bool> setLocale(Locale locale) async {
    return await (await _getInstance())
        .setString(_localeKey, locale.languageCode);
  }

  static Future<Locale> getLocale() async {
    String? value = (await _getInstance()).getString(_localeKey);
    if (value == null) {
      return const Locale('en');
    }
    return Locale(value);
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
