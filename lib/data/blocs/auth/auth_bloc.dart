



import 'package:auth_nav/bloc/auth_navigation_bloc.dart';
import 'package:auth_nav/bloc/auth_navigation_state.dart';
import 'package:chat_app_flutter/data/repository_imp/auth_repository_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2_dio/oauth2_manager.dart';

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
      goToMainNav(userCredential);
    }).catchError((err) {
      throw(err);
    });
  }

  Future createAccount(String name, String email, String password) async {
    await _authRepository.createAccount(email, password).then((value) async {
      UserCredential userCredential = value as UserCredential;
      await _authRepository.createUserModel(userCredential.user!.uid, name, userCredential.user!.email ?? '');
      goToMainNav(userCredential);
    }).catchError((err) {
      throw(err);
    });
  }

  Future goToMainNav(UserCredential userCredential) async {
    if (userCredential.user != null) {
      GetIt.instance.get<Oauth2Manager<String>>().add(userCredential.user!.uid);
      emit(AuthState.authorized());
    }
  }

  Future logout() async {
    GetIt.instance.get<Oauth2Manager<String>>().add(null);
    emit(const AuthState.unAuthorized());
  }

}