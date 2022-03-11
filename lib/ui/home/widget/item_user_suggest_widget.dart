import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/model/room_chat_config/room_config_model.dart';
import '../../../data/repository_imp/room_chat_repository_imp.dart';

class ItemUserSuggestWidget extends StatefulWidget {
  String id_room;

  ItemUserSuggestWidget({Key? key, required this.id_room}) : super(key: key);

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
          return Container(
            width: 70,
            height: 70,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data!.room_image ?? '',
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,

                  ),
                ),
                Expanded(
                  child: Text(
                    '${snapshot.data!.room_name}',
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
