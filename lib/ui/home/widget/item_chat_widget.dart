


import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemChatWidget extends StatefulWidget {
  UserModel userModel;
  ItemChatWidget({Key? key, required this.userModel}) : super(key: key);

  @override
  _ItemChatWidgetState createState() => _ItemChatWidgetState();
}

class _ItemChatWidgetState extends State<ItemChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(
              imageUrl: widget.userModel.avatar ?? '',
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
                '${widget.userModel.name}',
                style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(
                'Hello, Im Huan',
                style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ))
        ],
      ),
    );
  }
}
