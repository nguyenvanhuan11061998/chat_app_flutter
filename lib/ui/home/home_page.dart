import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/ui/home/widget/item_chat_widget.dart';
import 'package:chat_app_flutter/ui/home/widget/item_user_suggest_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/blocs/home/home_bloc.dart';
import '../../data/blocs/home/home_state.dart';
import '../chat_room/chat_room_page.dart';
import '../setting/setting_page.dart';
import '../widget/base_app_bar_widget.dart';
import '../widget/search_form_field.dart';

class HomePage extends StatefulWidget {
  static const path = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _homeBloc = context.read<HomeBloc>();
    _searchController = TextEditingController();
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
                appBar: BaseAppBarWidget(
                  leading: Container(),
                  avatar: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SettingPage.path);
                    },
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
                ),
                body: RefreshIndicator(
                  onRefresh: () {
                    return _homeBloc.initData();
                  },
                  child: Material(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 20 - MediaQuery.of(context).padding.top),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                              child: SearchFormField(
                                hint: 'T??m ki???m',
                                hintColor: const Color(0xff7A7A9D),
                                textEditingController: _searchController,
                                onEditingComplete: () {
                                  if (_searchController.text.trim().isNotEmpty && _searchController.text.trim() != userModel.email) {
                                    _homeBloc.search(_searchController.text.trim()).then((value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          _searchController.text = '';
                                        });
                                        Navigator.of(context).pushNamed(ChatRoomPage.path, arguments: value).then((value) {
                                          setState(() {
                                            _homeBloc.initData();
                                          });
                                        });
                                      } else {
                                        _homeBloc.findUser(_searchController.text.trim()).then((value) {
                                          if (value != null) {
                                            _homeBloc.createNewRoomChat(userModel, value).then((value){
                                              Navigator.of(context).pushNamed(ChatRoomPage.path, arguments: value).then((value) {
                                                setState(() {
                                                  _homeBloc.initData();
                                                });
                                              });
                                            }).onError((error, stackTrace) {
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                content: Text("???? c?? l???i x???y ra."),
                                              ));
                                            });
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              content: Text("Kh??ng t??m th???y ng?????i d??ng."),
                                            ));
                                          }
                                        });
                                      }
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            if (userModel.list_chat != null)
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(ChatRoomPage.path, arguments: userModel.list_chat![index]).then((value) {
                                            setState(() {
                                              _homeBloc.initData();
                                            });
                                          });
                                        },
                                        child: ItemUserSuggestWidget(
                                          id_room: userModel.list_chat![index],
                                          keyUser: userModel.keyUser??'',
                                        ),
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
                                    return InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(ChatRoomPage.path, arguments: userModel.list_chat![index]).then((value) {
                                          setState(() {
                                            _homeBloc.initData();
                                          });
                                        });
                                      },
                                      child: ItemChatWidget(
                                        idRoom: userModel.list_chat![index],
                                        keyUser: userModel.keyUser??'',
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 5);
                                  },
                                  itemCount: userModel.list_chat!.length),
                          ],
                        ),
                      ),
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
