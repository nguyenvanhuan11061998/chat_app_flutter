import 'package:auth_nav/auth_nav.dart';
import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:chat_app_flutter/data/repository_imp/user_repository_imp.dart';
import 'package:chat_app_flutter/ui/auth/auth_navigator.dart';
import 'package:chat_app_flutter/ui/home/main_navigator.dart';
import 'package:chat_app_flutter/ui/splash/app_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthNavigation(
          splashScreen: AppSplashScreen((context) async {
            await Future.delayed(const Duration(seconds: 3));
            if (GetIt.instance.get<LocalService>().getKeyUser().isNotEmpty) {
              // await GetIt.I.get<UserRepositoryImp>().getUserModel(GetIt.I.get<LocalService>().getKeyUser());
              return AuthNavigationState.authorized();
            } else {
              return AuthNavigationState.unAuthorized();
            }
          }),
          unAuthorizedBuilder: (BuildContext context) {
            return AuthNavigator();
          },
          authorizedBuilder: (BuildContext context) {
            return MainNavigator();
          },
          maintenanceBuilder: (context) => Container()),
    );
  }
}
