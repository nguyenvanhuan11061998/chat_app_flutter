


import 'package:chat_app_flutter/ui/auth/sign_in_page.dart';
import 'package:chat_app_flutter/ui/auth/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/navigator_support.dart';

class AuthNavigator extends StatefulWidget {
  const AuthNavigator({Key? key}) : super(key: key);

  @override
  _AuthNavigatorState createState() => _AuthNavigatorState();
}

class _AuthNavigatorState extends State<AuthNavigator> {
  @override
  Widget build(BuildContext context) {
    return NavigatorSupport(
      initialRoute: SignUpPage.path,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case SignUpPage.path:
            return MaterialPageRoute(builder: (context) => const SignUpPage());
          case SignInPage.path:
            return MaterialPageRoute(builder: (context) => const SignInPage());
        }
      },
    );
  }
}
