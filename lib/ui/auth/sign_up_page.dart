


import 'package:chat_app_flutter/ui/auth/sign_in_page.dart';
import 'package:chat_app_flutter/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/blocs/auth/auth_bloc.dart';
import '../../gen/assets.gen.dart';
import '../widget/app_text_form_field.dart';
import '../widget/message_widget.dart';

class SignUpPage extends StatefulWidget {
  static const String path = 'SignUpPage';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final GlobalKey<FormState> _formKey;
  String _name = '';
  String _email = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Đăng ký'),
          centerTitle: true,
          backgroundColor: ColorConstants.primaryColor,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Image.asset(
                  Assets.images.logoChatApp.path,
                  height: 80,
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(height: 24),
                AppTextFormField(
                  hint: 'Nhập tên',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Tên của bạn là gì';
                    } else {
                      _name = value.trim();
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  hint: 'Nhập email',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Yêu cầu nhập email';
                    } else {
                      _email = value.trim();
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  hint: 'Nhập mật khẩu',
                  isPassword: true,
                  validator: (value){
                    if (value == null || value.trim().isEmpty) {
                      return 'Yêu cầu nhập mật khẩu';
                    } else if (value.trim().length < 8) {
                      return 'Mật khẩu phải có độ dài ít nhất 8 ký tự';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                AppTextFormField(
                  hint: 'Nhập lại mật khẩu',
                  isPassword: true,
                  validator: (value){
                    if (value == null || value.trim().isEmpty) {
                      return 'Yêu cầu nhập lại mật khẩu';
                    } else if (value.trim() != value.trim()){
                      return 'Mật khẩu nhập lại không chính xác';
                    } else {
                      _password = value.trim();
                      return null;
                    }
                  },
                ),
                SizedBox(height: 30),

                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<AuthBloc>().createAccount(_name, _email, _password).then((value) {

                    }).catchError((err) {
                      showDialog(context: context, builder: (context) {
                        return MessageWidget(title: 'Thông báo', content: (err as FirebaseAuthException).message ?? '', backgroundColor: 0xffDD0A18,);
                      });
                    });
                  }
                }, child: const Text("Đăng ký")),
                const SizedBox(height: 30),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(SignInPage.path);
                    },
                    child: const Text('Đã có tài khoản, đăng nhập')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
