

import 'package:chat_app_flutter/ui/home/widget/item_chat_widget.dart';
import 'package:chat_app_flutter/ui/home/widget/item_user_suggest_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/blocs/home/home_bloc.dart';
import '../../data/blocs/home/home_state.dart';
import '../../gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  static const path = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
              SvgPicture.asset(Assets.icons.icShare, width: 20, height: 20),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocProvider.value(
          value: _homeBloc,
          child: BlocBuilder<HomeBloc, HomeState>(
            bloc: _homeBloc,
            builder: (BuildContext context, state) {
              return state.when((listUser, users) {
                return SingleChildScrollView(
                  // physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (users.isNotEmpty)
                        SizedBox(
                          height: 120,
                          child: ListView.separated(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ItemUserSuggestWidget(
                                  userModel: listUser[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 16);
                              },
                              itemCount: users.length),
                        ),
                      if (listUser.isNotEmpty)
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                            itemBuilder: (context, index) {
                              return ItemChatWidget(
                                userModel: listUser[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 10);
                            },
                            itemCount: listUser.length),
                    ],
                  ),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, error: (error) {
                return Container();
              });
            },
          ),
        ));
  }
}
