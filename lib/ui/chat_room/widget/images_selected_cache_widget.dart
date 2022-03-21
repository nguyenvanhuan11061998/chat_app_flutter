import 'dart:io';
import 'dart:typed_data';

import 'package:chat_app_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../data/blocs/chat_room/chat_room_bloc.dart';
import '../../../data/model/image_cache_model.dart';

class ImagesSelectedCacheWidget extends StatefulWidget {
  List<ImageCacheModel> listImageSelectCache;

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
            String path = widget.listImageSelectCache[index].path ?? '';
            if ((widget.listImageSelectCache[index].path ?? '').contains('.mp4')) {
              if (widget.listImageSelectCache[index].uint8list != null && widget.listImageSelectCache[index].uint8list!.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned(
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.memory(
                                  widget.listImageSelectCache[index].uint8list!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: InkWell(
                            onTap: () async {
                              await context.read<ChatRoomBloc>().removeImageCache(
                                  index);
                            },
                            child: SvgPicture.asset(Assets.icons.icRemoveItem,
                                width: 16, height: 16, fit: BoxFit.fill),
                          ),
                        ),
                      ],
                    ),
                    color: Colors.white,
                  ),
                );
              } else {
                return FutureBuilder<Uint8List?>(
                    future: getThumbnail(widget.listImageSelectCache[index].path?? ''),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        widget.listImageSelectCache[index].uint8list = snapshot.data!;
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            child: Stack(
                              children: [
                                Positioned(
                                  child: SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.memory(
                                        snapshot.data!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: InkWell(
                                    onTap: () async {
                                      await context.read<ChatRoomBloc>().removeImageCache(
                                          index);
                                    },
                                    child: SvgPicture.asset(Assets.icons.icRemoveItem,
                                        width: 16, height: 16, fit: BoxFit.fill),
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    });
              }
            } else {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.file(
                              File(path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: InkWell(
                          onTap: () async {
                            await context.read<ChatRoomBloc>().removeImageCache(
                                index);
                          },
                          child: SvgPicture.asset(Assets.icons.icRemoveItem,
                              width: 16, height: 16, fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                  color: Colors.white,
                ),
              );
            }
          }),
    );
  }

  Future<Uint8List?> getThumbnail(String pathVideo) {
    return VideoThumbnail.thumbnailData(
        video: pathVideo,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 128,
        quality: 50);
  }
}
