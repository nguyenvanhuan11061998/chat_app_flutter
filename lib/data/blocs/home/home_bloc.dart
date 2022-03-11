


import 'dart:convert';

import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:chat_app_flutter/data/repository/user_repository.dart';
import 'package:chat_app_flutter/data/repository_imp/room_chat_repository_imp.dart';
import 'package:chat_app_flutter/data/repository_imp/user_repository_imp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../model/user/user_model_dto.dart';
import '../../repository/room_chat_repository.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {

  late UserModel userModel;

  final UserRepository _userRepository = GetIt.instance.get<UserRepositoryImp>();
  final RoomChatRepository _chatRepository = GetIt.I.get<RoomChatRepositoryImp>();

  HomeBloc() : super(const HomeState.loading()) {
    initData();
  }

  Future<void> initData() async {
    String keyUser = GetIt.instance.get<LocalService>().getKeyUser();
    _userRepository.getUserModel(keyUser, true).then((value) {
      userModel = value;
      emit(HomeState(userModel));
    }).onError((error, stackTrace) {
      emit(HomeState.error(error));
    });
  }

  Future<String> search(String keySearch) {
      return _chatRepository.searchRoom(userModel.keyUser??'', keySearch);
  }

  Future<dynamic> findUser(String keySearch) {
    return _chatRepository.findUser(keySearch);
  }

  Future createNewRoomChat(UserModel userModel, UserModel user) {
    return _chatRepository.createNewRoomChat(userModel, user);
  }

}