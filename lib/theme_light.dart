

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
    textTheme: TextTheme(
        button: ThemeData.light().textTheme.button!.copyWith(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'PlusJakarta'),
        caption: ThemeData.light().textTheme.caption!.copyWith(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: 'PlusJakarta'),
        headline6: ThemeData.light().textTheme.headline6!.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
            fontFamily: 'PlusJakarta'),
        headline5: ThemeData.light().textTheme.headline5!.copyWith(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlusJakarta'),
        headline4: ThemeData.light().textTheme.headline4!.copyWith(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlusJakarta'),
        headline3: ThemeData.light().textTheme.headline3!.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlusJakarta'),
        headline2: ThemeData.light().textTheme.headline2!.copyWith(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlusJakarta'),
        headline1: ThemeData.light().textTheme.headline1!.copyWith(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlusJakarta'),
        subtitle1: ThemeData.light().textTheme.subtitle1!.copyWith(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'PlusJakarta'
          //da dung
        ),
        subtitle2: ThemeData.light().textTheme.subtitle2!.copyWith(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'PlusJakarta'),
        bodyText2: ThemeData.light().textTheme.bodyText2!.copyWith(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'PlusJakarta'),
        bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'PlusJakarta')),
  );
}