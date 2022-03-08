



import 'package:auth_nav/bloc/auth_navigation_bloc.dart';
import 'package:auth_nav/bloc/auth_navigation_state.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:chat_app_flutter/data/repository_imp/auth_repository_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2_dio/oauth2_manager.dart';

import '../../model/user/user_model_dto.dart';
import '../../repository/auth_repository.dart';
import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final AuthNavigationBloc authNavigationBloc = GetIt.instance.get();

  final AuthRepository _authRepository = GetIt.instance.get<AuthRepositoryImp>();

  AuthBloc() : super(const AuthState.unAuthorized()) {
    GetIt.instance.get<Oauth2Manager<String>>().controller.stream.listen((event) {
      if (event != null) {
        authNavigationBloc.emit(AuthNavigationState.authorized());
      } else {
        authNavigationBloc.emit(AuthNavigationState.unAuthorized());
      }
    });
  }

  Future login(String email, String password) async {
    await _authRepository.login(email, password).then((value) {
      UserCredential userCredential = value as UserCredential;
      UserModel userModel;
      if (userCredential.user != null) {
        userModel = UserModelDto(
            userCredential.user!.uid, userCredential.user!.email,
            userCredential.user!.displayName, userCredential.user!.phoneNumber, userCredential.user!.photoURL);
        GetIt.instance.get<Oauth2Manager<String>>().add(userCredential.user!.uid);
        emit(AuthState.authorized(userModel));
      }
    }).catchError((err) {
      throw(err);
    });
  }

  Future createAccount(String email, String password) async {
    await _authRepository.createAccount(email, password).then((value) {
      UserCredential userCredential = value as UserCredential;
      UserModel userModel;
      if (userCredential.user != null) {
        userModel = UserModelDto(
            userCredential.user!.uid, userCredential.user!.email,
            userCredential.user!.displayName, userCredential.user!.phoneNumber, userCredential.user!.photoURL);
        GetIt.instance.get<Oauth2Manager<String>>().add(userCredential.user!.uid);
        emit(AuthState.authorized(userModel));
      }
    }).catchError((err) {
      throw(err);
    });
  }

}