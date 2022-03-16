import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/data/blocs/chat_room/chat_room_bloc.dart';
import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:chat_app_flutter/gen/assets.gen.dart';
import 'package:chat_app_flutter/ui/chat_room/widget/message_item_widget.dart';
import 'package:chat_app_flutter/ui/widget/base_app_bar_widget.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../data/blocs/chat_room/chat_room_state.dart';
import '../../data/model/message/message_model_dto.dart';
import '../../utils/app_constants.dart';

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
  late String keyUserCurrent;

  @override
  void initState() {
    super.initState();
    keyUserId = GetIt.I.get<LocalService>().getKeyUser();
    messageController = TextEditingController();
    _scrollController = ScrollController();
    keyUserCurrent = '';
    _roomBloc = ChatRoomBloc(widget.id_room, keyUserId);
  }

  void scrollListData() {
    if (_scrollController.hasClients) {
      Timer(const Duration(microseconds: 1000), () {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(microseconds: 250), curve: Curves.ease);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      scrollListData();
    });
    return BlocProvider.value(
      value: _roomBloc,
      child: BlocBuilder<ChatRoomBloc, ChatRoomState>(
        builder: (BuildContext context, state) {
          return state.when((roomConfigModel, mapUser) {
            return Scaffold(
              appBar: BaseAppBarWidget(
                showLineBottom: true,
                avatar: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: roomConfigModel.room_image ?? '',
                    height: 55,
                    width: 55,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                title: Text(
                  roomConfigModel.room_name ?? '',
                  style: const TextStyle(
                      color: ColorConstants.textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                action: SvgPicture.asset(Assets.icons.icPhone, width: 24, height: 24, color: ColorConstants.textColor,),
              ),
              body: Material(
                color: Color(0x68f3f3f3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: FirebaseAnimatedList(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          controller: _scrollController,
                          query: _roomBloc.getMessages(),
                          reverse: false,
                          itemBuilder: (context, snapshot, animation, index) {
                            MessageModelDto message = MessageModelDto.fromJson(
                                Map<String, dynamic>.from(
                                    snapshot.value as Map));
                            bool changeUser =
                                (keyUserCurrent != message.keyUser);
                            keyUserCurrent = message.keyUser ?? '';
                            return MessageItemWidget(
                                dataMessage: message,
                                user: mapUser[message.keyUser],
                                changeUser: changeUser,
                                isCurrentUser: message.keyUser == keyUserId);
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
                                  placeholder: 'Aa',
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            )),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                if (messageController.text.trim().isNotEmpty) {
                                  _roomBloc
                                      .sendMessage(
                                          messageController.text.trim())
                                      .then((value) {
                                    if (value != null && value) {
                                      setState(() {
                                        messageController.clear();
                                        FocusScope.of(context).unfocus();
                                        scrollListData();
                                      });
                                    }
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
