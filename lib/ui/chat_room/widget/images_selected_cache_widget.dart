import 'dart:io';

import 'package:chat_app_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ImagesSelectedCacheWidget extends StatefulWidget {
  List<String> listImageSelectCache;

  ImagesSelectedCacheWidget({Key? key, required this.listImageSelectCache})
      : super(key: key);

  @override
  _ImagesSelectedCacheWidgetState createState() =>
      _ImagesSelectedCacheWidgetState();
}

class _ImagesSelectedCacheWidgetState extends State<ImagesSelectedCacheWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listImageSelectCache.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Stack(
                children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.file(
                        File(widget.listImageSelectCache[index]),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: SvgPicture.asset(Assets.icons.icRemoveItem,
                        width: 16, height: 16, fit: BoxFit.fill),
                  ),
                ],
              ),
              color: Colors.white,
            );
          }),
    );
  }
}
