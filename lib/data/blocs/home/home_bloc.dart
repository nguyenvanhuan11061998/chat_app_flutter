


import 'dart:convert';

import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:chat_app_flutter/data/repository/user_repository.dart';
import 'package:chat_app_flutter/data/repository_imp/user_repository_imp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../model/user/user_model_dto.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {

  final UserRepository _userRepository = GetIt.instance.get<UserRepositoryImp>();

  HomeBloc() : super(const HomeState.loading()) {
    initData();
  }

  Future<void> initData() async {
    String keyUser = GetIt.instance.get<LocalService>().getKeyUser();
    _userRepository.getUserModel(keyUser).then((value) {
      final data = value as QuerySnapshot;
      UserModel userModel = UserModelDto.fromJson(data.docs.first.data() as Map<String, dynamic>);
      GetIt.I.get<LocalService>().saveUserModel(jsonEncode(data.docs.first.data() as Map<String, dynamic>));
      emit(HomeState(userModel));
    }).onError((error, stackTrace) {
      emit(HomeState.error(error));
    });
  }

}