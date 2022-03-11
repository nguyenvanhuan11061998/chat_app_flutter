



import 'package:chat_app_flutter/data/blocs/setting/setting_state.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBloc extends Cubit<SettingState>{

  final UserModel userModel;

  SettingBloc(this.userModel) : super(const SettingState.loading()) {
    initData();
  }

  void initData() {
    emit(SettingState(userModel));
  }

}