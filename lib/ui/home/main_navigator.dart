


import 'package:chat_app_flutter/data/blocs/home/home_bloc.dart';
import 'package:chat_app_flutter/ui/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../utils/navigator_support.dart';
import '../auth/change_password_page.dart';
import '../chat_room/chat_room_page.dart';
import '../setting/setting_page.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final GlobalKey<NavigatorSupportState> _keyNav = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          final cubit = HomeBloc();
          return cubit;
        })
      ],
      child: NavigatorSupport(
        key: _keyNav,
        initialRoute: HomePage.path,
        onGenerateRoute: (setting) {
          switch (setting.name) {
            case HomePage.path:
              return MaterialPageRoute(builder: (context) => const HomePage());
            case ChatRoomPage.path:
              return MaterialPageRoute(builder: (context) => ChatRoomPage(id_room: setting.arguments as String));
            case SettingPage.path:
              return MaterialPageRoute(builder: (context) => const SettingPage());
            case ChangePasswordPage.path:
              return MaterialPageRoute(builder: (context) => const ChangePasswordPage());
          }
        },
      ),
    );
  }
}
