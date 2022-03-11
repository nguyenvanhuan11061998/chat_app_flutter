import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/data/blocs/chat_room/chat_room_bloc.dart';
import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:chat_app_flutter/gen/assets.gen.dart';
import 'package:chat_app_flutter/ui/chat_room/widget/message_item_widget.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../data/blocs/chat_room/chat_room_state.dart';

class ChatRoomPage extends StatefulWidget {
  String id_room;
  static const path = 'ChatRoomPage';

  ChatRoomPage({Key? key, required this.id_room}) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  late ChatRoomBloc _roomBloc;
  late TextEditingController messageController;
  late ScrollController _scrollController;
  late String keyUserId;

  @override
  void initState() {
    super.initState();
    _roomBloc = ChatRoomBloc(widget.id_room);
    messageController = TextEditingController();
    _scrollController = ScrollController();
    keyUserId = GetIt.I.get<LocalService>().getKeyUser();
  }

  void scrollListData() {
    Timer(const Duration(microseconds: 1000), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(microseconds: 250), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 250));
      scrollListData();
    });
    return BlocProvider.value(
      value: _roomBloc,
      child: BlocBuilder<ChatRoomBloc, ChatRoomState>(
        builder: (BuildContext context, state) {
          return state.when((roomConfigModel) {
            return Scaffold(
              appBar: AppBar(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(Assets.icons.icBack,
                            width: 200, height: 20)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                        imageUrl: roomConfigModel.list_user!.first.avatar ?? '',
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
                title: Text('${roomConfigModel.room_name}'),
                centerTitle: true,
              ),
              body: Material(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: FirebaseAnimatedList(
                          controller: _scrollController,
                          query: _roomBloc.getMessages(),
                          reverse: false,
                          itemBuilder: (context, snapshot, animation, index) {
                            return MessageItemWidget(
                                dataMessage: snapshot, keyUserId: keyUserId);
                          }),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Material(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: CupertinoTextField(
                              onTap: () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 250));
                                scrollListData();
                              },
                              controller: messageController,
                            )),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                if (messageController.text.trim().isNotEmpty) {
                                  _roomBloc
                                      .sendMessage(
                                          messageController.text.trim())
                                      .then((value) {
                                    setState(() {
                                      messageController.clear();
                                      FocusScope.of(context).unfocus();
                                      scrollListData();
                                    });
                                  });
                                }
                              },
                              child: SvgPicture.asset(Assets.icons.icShare,
                                  width: 20, height: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
    );
  }
}
