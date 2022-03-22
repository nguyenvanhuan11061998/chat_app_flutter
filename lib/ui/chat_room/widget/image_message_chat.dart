import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/ui/chat_room/widget/video_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ImageMessageChat extends StatefulWidget {
  List<String> listImage;

  ImageMessageChat({Key? key, required this.listImage}) : super(key: key);

  @override
  _ImageMessageChatState createState() => _ImageMessageChatState();
}

class _ImageMessageChatState extends State<ImageMessageChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.listImage.length == 1
          ? Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: (widget.listImage.first ?? '').contains('.mp4')
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.8,
                          height: MediaQuery.of(context).size.height / 3,
                          child:
                              VideoMessageWidget(url: widget.listImage.first)))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: widget.listImage.first ?? '',
                        width: MediaQuery.of(context).size.width / 1.8,
                        height: MediaQuery.of(context).size.height / 1.8,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width / 1.6,
              child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 4),
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.listImage.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: (widget.listImage[index] ?? '').contains('.mp4')
                          ? VideoMessageWidget(url: widget.listImage[index])
                          : CachedNetworkImage(
                              imageUrl: widget.listImage[index] ?? '',
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                    );
                  }),
            ),
    );
  }
}
