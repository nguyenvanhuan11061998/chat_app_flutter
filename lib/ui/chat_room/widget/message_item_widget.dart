import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:chat_app_flutter/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/message/message_model_dto.dart';

class MessageItemWidget extends StatefulWidget {
  MessageModelDto dataMessage;
  UserModel? user;
  bool changeUser;
  bool isCurrentUser;

  MessageItemWidget({Key? key, required this.dataMessage, required this.user, required this.changeUser, required this.isCurrentUser})
      : super(key: key);

  @override
  _MessageItemWidgetState createState() => _MessageItemWidgetState();
}

class _MessageItemWidgetState extends State<MessageItemWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataMessage.type == 'text') {
      if (widget.isCurrentUser) {
        return Column(
          children: [
            if (widget.changeUser)
              const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 4),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConstants.primaryColor),
                      child: Text(
                        '${widget.dataMessage.content}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: widget.user!.avatar ?? '',
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.grayColor),
                  child: Text(
                    '${widget.dataMessage.content}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 4),
            ],
          ),
        );
      }
    } else {
      return Container();
    }
  }
}
