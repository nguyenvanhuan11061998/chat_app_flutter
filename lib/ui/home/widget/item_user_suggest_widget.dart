import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/model/room_chat_config/room_config_model.dart';
import '../../../data/repository_imp/room_chat_repository_imp.dart';

class ItemUserSuggestWidget extends StatefulWidget {
  String id_room;
  String keyUser;

  ItemUserSuggestWidget({Key? key, required this.id_room, required this.keyUser}) : super(key: key);

  @override
  _ItemUserSuggestWidgetState createState() => _ItemUserSuggestWidgetState();
}

class _ItemUserSuggestWidgetState extends State<ItemUserSuggestWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RoomConfigModel?>(
      future: GetIt.I.get<RoomChatRepositoryImp>().getConfigRoom(widget.id_room),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String roomName = '';
          if (snapshot.data!.room_name!.isNotEmpty) {
            roomName = snapshot.data!.room_name!;
          } else if (snapshot.data!.list_user![0].keyUser == widget.keyUser) {
            roomName = snapshot.data!.list_user![1].name??'';
          } else {
            roomName = snapshot.data!.list_user![0].name??'';
          }
          String roomAvatar = '';
          if (snapshot.data!.room_image!.isNotEmpty) {
            roomAvatar = snapshot.data!.room_image!;
          } else if (snapshot.data!.list_user![0].keyUser == widget.keyUser) {
            roomAvatar = snapshot.data!.list_user![1].avatar??'';
          } else {
            roomAvatar = snapshot.data!.list_user![0].avatar??'';
          }
          return Container(
            width: 70,
            height: 70,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: roomAvatar,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,

                  ),
                ),
                Expanded(
                  child: Text(
                    roomName,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
