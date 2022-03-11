

import 'package:chat_app_flutter/data/repository_imp/room_chat_repository_imp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/model/message/message_model.dart';

class ItemLatestMessageWidget extends StatefulWidget {
  String id_room;
  ItemLatestMessageWidget({Key? key, required this.id_room}) : super(key: key);

  @override
  _ItemLatestMessageWidgetState createState() => _ItemLatestMessageWidgetState();
}

class _ItemLatestMessageWidgetState extends State<ItemLatestMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MessageModel>(
      future: GetIt.I.get<RoomChatRepositoryImp>().getLatestMessage(widget.id_room),
      builder: (context, snap) {
        if (snap.hasData) {
          return Container(
            child: Text(
              '${snap.data!.content}',
              style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
