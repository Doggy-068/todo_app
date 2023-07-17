import 'package:todo_app/storage/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

void main() {
  group(('test storage'), () {
    SharedPreferences.setMockInitialValues({});

    test('test default locale and theme', () async {
      expect(await Storage.getLocale(), const Locale('en'));
      expect(await Storage.getThemeColor(), isSameColorAs(Colors.blue));
    });

    test('set locale then get it', () async {
      if (await Storage.setLocale(const Locale('zh'))) {
        expect(await Storage.getLocale(), const Locale('zh'));
      }
    });

    test('set theme then get it', () async {
      if (await Storage.setThemeColor(Colors.green)) {
        expect(await Storage.getThemeColor(), isSameColorAs(Colors.green));
      }
    });
  });
}
