


import 'package:chat_app_flutter/utils/app_constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/message/message_model_dto.dart';

class MessageItemWidget extends StatefulWidget {
  DataSnapshot dataMessage;
  String keyUserId;
  MessageItemWidget({Key? key, required this.dataMessage, required this.keyUserId}) : super(key: key);

  @override
  _MessageItemWidgetState createState() => _MessageItemWidgetState();
}

class _MessageItemWidgetState extends State<MessageItemWidget> {
  late MessageModelDto message;

  @override
  void initState() {
    super.initState();
    message = MessageModelDto.fromJson(Map<String, dynamic>.from(widget.dataMessage.value as Map));
  }

  @override
  Widget build(BuildContext context) {
    if (message.type == 'text') {
      if (message.keyUser == widget.keyUserId) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
          child: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width/5),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.primaryColor
                  ),
                  child: Text(
                    '${message.content}', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.grayColor
                  ),
                  child: Text(
                    '${message.content}', style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                  ),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width/5),
            ],
          ),
        );
      }
    } else {
      return Container();
    }
  }
}
