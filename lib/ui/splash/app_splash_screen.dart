
import 'package:auth_nav/auth_nav.dart';
import 'package:chat_app_flutter/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class AppSplashScreen extends SplashPage {
  AppSplashScreen(InitializeApp initializeApp) : super(initializeApp);

  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends SplashPageState<AppSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColor,
      child: Center(
        child: Image.asset(
          Assets.images.logoChatApp.path,
          height: 80,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
