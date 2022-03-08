
import 'package:auth_nav/auth_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSplashScreen extends SplashPage {
  AppSplashScreen(InitializeApp initializeApp) : super(initializeApp);

  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends SplashPageState<AppSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
