import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/data/blocs/chat_room/chat_room_bloc.dart';
import 'package:chat_app_flutter/data/data_source/local_service.dart';
import 'package:chat_app_flutter/gen/assets.gen.dart';
import 'package:chat_app_flutter/ui/chat_room/widget/attach_file_widget.dart';
import 'package:chat_app_flutter/ui/chat_room/widget/images_selected_cache_widget.dart';
import 'package:chat_app_flutter/ui/chat_room/widget/message_item_widget.dart';
import 'package:chat_app_flutter/ui/widget/base_app_bar_widget.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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
  bool emojiShowing = false;

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

  _onEmojiSelected(Emoji emoji) {
    messageController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: messageController.text.length));
  }

  _onBackspacePressed() {
    messageController
      ..text = messageController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: messageController.text.length));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      scrollListData();
    });
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          setState(() {
            emojiShowing = false;
          });
        }
      },
      child: BlocProvider.value(
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
                      imageUrl: roomConfigModel.room_image ?? Assets.icons.icUserDefault,
                      height: 48,
                      width: 48,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roomConfigModel.room_name ?? '',
                        style: const TextStyle(
                            color: ColorConstants.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Online',
                        style: TextStyle(
                            color: ColorConstants.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  action: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.icons.icChatCallVideo, width: 24, height: 24, color: ColorConstants.textColor,),
                      const SizedBox(width: 24),
                      SvgPicture.asset(Assets.icons.icChatOption, width: 4, height: 16, color: ColorConstants.textColor,),
                    ],
                  ),
                ),
                body: Material(
                  color: Colors.white,
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
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
                        child: Material(
                          color: Colors.white,
                          child: Column(
                            children: [
                              StreamBuilder(
                                stream: _roomBloc.listImageSelectCacheStream,
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.data
                                          .isNotEmpty) {
                                    return ImagesSelectedCacheWidget(
                                        listImageSelectCache: snapshot.data);
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AttackFileWidget(key: ValueKey(DateTime.now()), onSelectedImage: (List<String> value) async {
                                    if (value.isNotEmpty) {
                                      await _roomBloc.addImage(value);
                                    }
                                  },),
                                  Expanded(
                                      child: FocusScope(
                                        child: Focus(
                                          onFocusChange: (isFocus) {
                                            if (isFocus) {
                                              setState(() {
                                                emojiShowing = false;
                                              });
                                            }
                                          },
                                          child: CupertinoTextField(
                                            enableInteractiveSelection: false,
                                              onTap: () async {
                                              await Future.delayed(
                                                const Duration(milliseconds: 250));
                                              scrollListData();
                                              },
                                            controller: messageController,
                                            placeholder: 'Write a message...',
                                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                                            style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                                            maxLines: 6,
                                            minLines: 1,
                                            suffix: Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    emojiShowing = !emojiShowing;
                                                    if (emojiShowing) {
                                                      FocusScope.of(context).unfocus();
                                                    }
                                                  });
                                                },
                                                child: SvgPicture.asset(Assets.icons.icIconsChat, width: 24, height: 24),
                                              ),
                                            ),
                                  ),
                                        ),
                                      )),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      if (messageController.text.trim().isNotEmpty && _roomBloc.listImageSelectCache.isNotEmpty) {
                                        _roomBloc
                                            .sendMessage(
                                                messageController.text.trim(), _roomBloc.listImageSelectCache)
                                            .then((value) {
                                          if (value != null && value) {
                                            setState(() {
                                              _roomBloc.listImageSelectCache = [];
                                              messageController.clear();
                                              FocusScope.of(context).unfocus();
                                              scrollListData();
                                            });
                                          }
                                        });
                                      }
                                    },
                                    child: SvgPicture.asset(Assets.icons.icChatSendMess,
                                        width: 20, height: 20, color: ColorConstants.primaryColor,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedSize(
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 300),
                        child: emojiShowing ? SizedBox(
                          height: 250,
                          child: EmojiPicker(
                              onEmojiSelected: (Category category, Emoji emoji) {
                                _onEmojiSelected(emoji);
                              },
                              onBackspacePressed: _onBackspacePressed,
                              config: Config(
                                  columns: 7,
                                  // Issue: https://github.com/flutter/flutter/issues/28894
                                  emojiSizeMax:
                                      32 * (Platform.isIOS ? 1.30 : 1.0),
                                  verticalSpacing: 0,
                                  horizontalSpacing: 0,
                                  initCategory: Category.RECENT,
                                  bgColor: const Color(0xFFF2F2F2),
                                  indicatorColor: Colors.blue,
                                  iconColor: Colors.grey,
                                  iconColorSelected: Colors.blue,
                                  progressIndicatorColor: Colors.blue,
                                  backspaceColor: Colors.blue,
                                  skinToneDialogBgColor: Colors.white,
                                  skinToneIndicatorColor: Colors.grey,
                                  enableSkinTones: true,
                                  showRecentsTab: true,
                                  recentsLimit: 28,
                                  noRecentsText: 'No Recents',
                                  noRecentsStyle: const TextStyle(
                                      fontSize: 20, color: Colors.black26),
                                  tabIndicatorAnimDuration: kTabScrollDuration,
                                  categoryIcons: const CategoryIcons(),
                                  buttonMode: ButtonMode.MATERIAL)),
                        ) : Container(),
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
      ),
    );
  }
}
