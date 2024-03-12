import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  Future<void> ChangeTheme(ThemeMode newMode) async {
    if (appTheme == newMode) {
      return;
    } else {
      appTheme = newMode;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDark', appTheme == ThemeMode.light ? false : true);

      notifyListeners();
    }
  }
  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }


}
