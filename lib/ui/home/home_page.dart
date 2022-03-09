import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/ui/home/widget/item_chat_widget.dart';
import 'package:chat_app_flutter/ui/home/widget/item_user_suggest_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/blocs/home/home_bloc.dart';
import '../../data/blocs/home/home_state.dart';

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
    return BlocProvider.value(
      value: _homeBloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: _homeBloc,
        builder: (BuildContext context, state) {
          return state.when((userModel) {
            return Scaffold(
                appBar: AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                        imageUrl: userModel.avatar??'',
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                body: RefreshIndicator(
                  onRefresh: () {
                    return _homeBloc.initData();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (userModel.list_chat != null)
                          SizedBox(
                            height: 120,
                            child: ListView.separated(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return ItemUserSuggestWidget(
                                    chatRoomModel: userModel.list_chat![index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 16);
                                },
                                itemCount: userModel.list_chat!.length),
                          ),
                        if (userModel.list_chat != null)
                          ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              itemBuilder: (context, index) {
                                return ItemChatWidget(
                                  chatRoomModel: userModel.list_chat![index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 5);
                              },
                              itemCount: userModel.list_chat!.length),
                      ],
                    ),
                  ),
                ));
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, error: (error) {
            return Container();
          });
        },
      ),
    );
  }
}
