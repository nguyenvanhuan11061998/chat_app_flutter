


import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/data/repository/room_chat_repository.dart';
import 'package:chat_app_flutter/data/repository_imp/room_chat_repository_imp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/model/room_chat_config/room_config_model.dart';
import 'item_latest_message_widget.dart';

class ItemChatWidget extends StatefulWidget {
  String idRoom;
  ItemChatWidget({Key? key, required this.idRoom}) : super(key: key);

  @override
  _ItemChatWidgetState createState() => _ItemChatWidgetState();
}

class _ItemChatWidgetState extends State<ItemChatWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RoomConfigModel?>(
      future: GetIt.I.get<RoomChatRepositoryImp>().getConfigRoom(widget.idRoom),
      builder: (context, snap) {
        if (snap.hasData) {
          return Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: snap.data!.room_image ?? '',
                    height: 55,
                    width: 55,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${snap.data!.room_name}',
                      style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    ItemLatestMessageWidget(id_room: widget.idRoom),
                  ],
                ))
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
