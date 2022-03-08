import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemUserSuggestWidget extends StatefulWidget {
  UserModel userModel;

  ItemUserSuggestWidget({Key? key, required this.userModel}) : super(key: key);

  @override
  _ItemUserSuggestWidgetState createState() => _ItemUserSuggestWidgetState();
}

class _ItemUserSuggestWidgetState extends State<ItemUserSuggestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(
              imageUrl: widget.userModel.avatar ?? '',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              alignment: Alignment.center,

            ),
          ),
          Expanded(
            child: Text(
              '${widget.userModel.name}',
              style: TextStyle(fontSize: 12, color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
