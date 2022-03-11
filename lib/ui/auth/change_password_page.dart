


import 'package:chat_app_flutter/data/blocs/auth/auth_bloc.dart';
import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:chat_app_flutter/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../widget/app_button_widget.dart';
import '../widget/app_text_form_field.dart';
import '../widget/message_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  static const path = 'ChangePasswordPage';

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _keyForm = GlobalKey<FormState>();
  String _newPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text('Đổi mật khẩu'),
        centerTitle: true,
        backgroundColor: ColorConstants.primaryColor,
        elevation: 0,
      ),
      body: Form (
        key: _keyForm,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                AppTextFormField(
                  hint: 'Nhập mật khẩu hiện tại',
                  isPassword: true,
                  validator: (value){
                    if (value == null || value.trim().isEmpty) {
                      return 'Yêu cầu nhập mật khẩu';
                    } else if (value.trim().length < 8) {
                      return 'Mật khẩu phải có độ dài ít nhất 8 ký tự';
                    } else if (value.trim() != GetIt.I.get<LocalService>().getPassword()) {
                      return 'Mật khẩu không chính xác';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 24),
                AppTextFormField(
                  hint: 'Nhập mật khẩu mới',
                  isPassword: true,
                  validator: (value){
                    if (value == null || value.trim().isEmpty) {
                      return 'Yêu cầu nhập mật khẩu mới';
                    } else if (value.trim() == GetIt.I.get<LocalService>().getPassword()) {
                      return 'Mật khẩu mới phải khác mật khẩu hiện tại';
                    } else {
                      _newPassword = value.trim();
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 24),
                AppTextFormField(
                  hint: 'Nhập lại mật khẩu mới',
                  isPassword: true,
                  validator: (value){
                    if (value == null || value.trim().isEmpty) {
                      return 'Yêu cầu nhập lại mật khẩu mới';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 32),
                AppButtonWidget(
                  title: 'Đổi mật khẩu',
                  onPressed: () {
                    if (_keyForm.currentState!.validate()) {
                      _keyForm.currentState!.save();
                      context.read<AuthBloc>().changePassword(_newPassword).then((value) {
                        if (value != null && value) {
                          Navigator.pop(context);
                          showDialog(context: context, builder: (context) {
                            return MessageWidget(title: 'Thông báo', content: 'Đổi mật khẩu thành công!', backgroundColor: 0xff34A853);
                          });
                        }
                      }).onError((error, stackTrace) {
                        showDialog(context: context, builder: (context) {
                          return MessageWidget(title: 'Thông báo', content: 'Đổi mật khẩu thất bại!', backgroundColor: 0xffDD0A18);
                        });
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
