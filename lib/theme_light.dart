

import 'package:chat_app_flutter/utils/app_constants.dart';
import 'package:flutter/material.dart';

ThemeData themeLight(BuildContext context) {
  return ThemeData.light().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      prefixStyle: const TextStyle(color: Colors.black),
      hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.normal, color: const Color(0xffDDE1EF)),
      labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.normal, color: const Color(0xffc4c4c4)),
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixStyle: const TextStyle(color: Colors.black),
      errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
      contentPadding: const EdgeInsets.all(16),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xffDDE1EF), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xffDDE1EF), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xffDDE1EF), width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
    ),
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