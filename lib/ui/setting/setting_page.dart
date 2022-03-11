import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/data/blocs/auth/auth_bloc.dart';
import 'package:chat_app_flutter/data/blocs/home/home_bloc.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:chat_app_flutter/ui/auth/change_password_page.dart';
import 'package:chat_app_flutter/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../data/blocs/setting/setting_bloc.dart';
import '../../data/blocs/setting/setting_state.dart';
import '../../gen/assets.gen.dart';

class SettingPage extends StatefulWidget {
  static const path = 'SettingPage';

  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late SettingBloc _bloc;
  late UserModel userModel;

  @override
  void initState() {
    super.initState();
    _bloc = SettingBloc(context.read<HomeBloc>().userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Xong',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocProvider.value(
        value: _bloc,
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (BuildContext context, state) {
            return state.when((user) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: user.avatar ?? '',
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        user.name ?? '',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {

                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Row(
                              children: [
                                SvgPicture.asset(Assets.icons.icPencil),
                                const SizedBox(width: 24),
                                const Text('Thay đổi email',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                        ),),
                    const SizedBox(height: 1),
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ChangePasswordPage.path);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.icons.icLock),
                              const SizedBox(width: 20),
                              const Text('Đổi mật khẩu',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                            ],
                          ),
                        ),
                      ),),
                    const SizedBox(height: 1),
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.icons.icPhone),
                              const SizedBox(width: 18),
                              const Text('Thêm số điện thoại',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                            ],
                          ),
                        ),
                      ),),
                    const SizedBox(height: 1),
                    Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            context.read<AuthBloc>().logout();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.logout,
                                  color: ColorConstants.primaryColor,
                                ),
                                SizedBox(width: 16),
                                Text('Đăng xuất',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, error: (err) {
              return Container();
            });
          },
        ),
      ),
    );
  }
}
