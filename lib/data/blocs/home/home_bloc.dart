


import 'package:chat_app_flutter/data/blocs/auth/auth_bloc.dart';
import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:chat_app_flutter/data/repository/user_repository.dart';
import 'package:chat_app_flutter/data/repository_imp/user_repository_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:async/async.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {

  final UserRepository _userRepository = GetIt.instance.get<UserRepositoryImp>();

  HomeBloc() : super(const HomeState.loading()) {
    String keyUser = GetIt.instance.get<LocalService>().getKeyUser();

    FutureGroup futureGroup = FutureGroup();
    futureGroup.add(_userRepository.getListUser(keyUser));
    futureGroup.add(_userRepository.getUsers(keyUser));
    futureGroup.close();
    futureGroup.future.then((value) {
      final List<UserModel> listUser = value[0];
      final List<UserModel> users = value [1];
      emit(HomeState(listUser, users));
    }).onError((error, stackTrace) {
      emit(HomeState.error(error));
    });
  }

}