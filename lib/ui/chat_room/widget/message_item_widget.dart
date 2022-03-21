import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/data/model/user/user_model.dart';
import 'package:chat_app_flutter/ui/chat_room/widget/image_message_chat.dart';
import 'package:chat_app_flutter/utils/app_constants.dart';
import 'package:chat_app_flutter/utils/utils.dart';
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
      if (widget.isCurrentUser) {
        return Column(
          children: [
            if (widget.changeUser)
              const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Text(
                      Utils.toStringTime(widget.dataMessage.time),
                      style: const TextStyle(
                          color: Color(0xffA1A1BC),
                          fontSize: 12,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  if ((widget.dataMessage.images??[]).isNotEmpty)
                    ImageMessageChat(listImage: widget.dataMessage.images!),
                  if ((widget.dataMessage.content ?? '').isNotEmpty)
                    Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 4),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0)),
                              color: ColorConstants.primaryColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('${widget.dataMessage.content}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16)),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
              ),
            ),
          ],
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Text(Utils.toStringTime(widget.dataMessage.time),
                    style: const TextStyle(
                        color: Color(0xffA1A1BC),
                        fontSize: 12,
                        fontWeight: FontWeight.w200)),
              ),
              if ((widget.dataMessage.images??[]).isNotEmpty)
                Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: ImageMessageChat(listImage: widget.dataMessage.images!)),
              if ((widget.dataMessage.content ?? '').isNotEmpty)
                Row(
                crossAxisAlignment: CrossAxisAlignment.end,
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
                  const SizedBox(width: 10),
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            color: ColorConstants.grayColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.dataMessage.content}',
                              style: const TextStyle(
                                  height: 1.4,
                                  color: ColorConstants.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                          ],
                        )),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 4),
                ],
              ),
          ],
          ),
        );
      }
  }
}
