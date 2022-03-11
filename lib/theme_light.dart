

import 'package:chat_app_flutter/utils/app_constants.dart';
import 'package:flutter/material.dart';

ThemeData themeLight(BuildContext context) {
  return ThemeData.light().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Colors.transparent),
        ),
        primary: ColorConstants.primaryColor,
        elevation: 0
      ),
    ),
  );
}