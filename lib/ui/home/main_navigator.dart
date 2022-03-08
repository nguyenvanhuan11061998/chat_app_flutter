


import 'package:chat_app_flutter/ui/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/navigator_support.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return NavigatorSupport(
      initialRoute: HomePage.path,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case HomePage.path:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
    );
  }
}
