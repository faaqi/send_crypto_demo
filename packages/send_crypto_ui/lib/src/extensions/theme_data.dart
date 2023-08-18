import 'package:send_crypto_ui/send_crypto_ui.dart';
import 'package:flutter/material.dart';

///Extension on Themedata that must be added to return the correct asset
extension ThemeX on ThemeData {
  ///Returns the correct SCIcon based on the current theme
  SCIcon get icons {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return SCIconsDark();
    } else {
      return  SCIconsLight();
    }
  }
}
