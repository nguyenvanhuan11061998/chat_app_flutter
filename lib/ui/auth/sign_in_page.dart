



import 'package:chat_app_flutter/data/blocs/auth/auth_bloc.dart';
import 'package:chat_app_flutter/ui/auth/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/app_text_form_field.dart';
import '../widget/message_widget.dart';

class SignInPage extends StatefulWidget {

  static const path = 'SignInPage';
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  late final GlobalKey<FormState> _formKey;
  String _email = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập')),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Đăng nhập", style: TextStyle(fontSize: 20),),
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
                  hint: 'Nhập password',
                  isPassword: true,
                  validator: (value){
                    if (value == null || value.trim().isEmpty) {
                      return 'Yêu cầu nhập mật khẩu';
                    } else {
                      _password = value.trim();
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<AuthBloc>().login(
                        _email, _password).then((value) {

                    }).catchError((err) {
                      showDialog(context: context, builder: (context) {
                        return MessageWidget(title: 'Thông báo', content: (err as FirebaseAuthException).message ?? '', backgroundColor: 0xffDD0A18);
                      });
                    });
                  }
                }, child: const Text("Đăng nhập"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  )
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
