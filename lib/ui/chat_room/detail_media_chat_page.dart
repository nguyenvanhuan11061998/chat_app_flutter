import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/ui/chat_room/widget/video_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailMediaChatPage extends StatefulWidget {
  static const String path = 'DetailMediaChatPage';

  List<String> listMedia;

  DetailMediaChatPage({Key? key, required this.listMedia}) : super(key: key);

  @override
  _DetailMediaChatPageState createState() => _DetailMediaChatPageState();
}

class _DetailMediaChatPageState extends State<DetailMediaChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CarouselSlider(
      items: widget.listMedia.map((e) {
        if (e.contains('.mp4')) {
          return VideoWidget(url: e);
        } else {
          return InteractiveViewer(
            minScale: 0.5,
            maxScale: 2,
            panEnabled: true,
            child: CachedNetworkImage(
              imageUrl: e,
              fit: BoxFit.contain,
            ),
          );
        }
      }).toList(),
      options: CarouselOptions(
          height: double.infinity,
          initialPage: 0,
          enableInfiniteScroll: false,
          viewportFraction: 1),
    ));
  }
}
