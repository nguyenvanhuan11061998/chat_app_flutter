


import 'package:auth_nav/bloc/auth_navigation_bloc.dart';
import 'package:chat_app_flutter/data/blocs/home/home_bloc.dart';
import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2_dio/oauth2_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/blocs/auth/auth_bloc.dart';
import 'data/repository_imp/auth_repository_imp.dart';
import 'data/repository_imp/room_chat_repository_imp.dart';
import 'data/repository_imp/user_repository_imp.dart';

Future initializeDependencies() async {


  GetIt.instance.registerSingleton(await SharedPreferences.getInstance());

  GetIt.instance.registerSingleton(LocalService());

  GetIt.instance.registerSingleton(AuthRepositoryImp());

  GetIt.instance.registerSingleton(UserRepositoryImp());

  GetIt.instance.registerSingleton(RoomChatRepositoryImp());

  Oauth2Manager<String> _oauth2Manager = Oauth2Manager<String>(
    currentValue: GetIt.instance.get<LocalService>().getKeyUser(),
    onSave: (value) {
      if (value == null) {
        GetIt.instance.get<SharedPreferences>().clear();
      } else {
        GetIt.instance.get<LocalService>().saveKeyUser(value);
      }
    }
  );
  GetIt.instance.registerSingleton(_oauth2Manager);

  GetIt.instance.registerSingleton(AuthNavigationBloc());

  GetIt.instance.registerSingleton(AuthBloc());
}