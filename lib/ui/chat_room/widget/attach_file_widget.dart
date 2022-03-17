

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../gen/assets.gen.dart';

class AttackFileWidget extends StatefulWidget {
  Function onSelectedImage;
  AttackFileWidget({Key? key, required this.onSelectedImage}) : super(key: key);

  @override
  _AttackFileWidgetState createState() => _AttackFileWidgetState();
}

class _AttackFileWidgetState extends State<AttackFileWidget> {
  late bool showAttach;

  @override
  void initState() {
    super.initState();
    showAttach = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showAttach
          ? AnimatedSize(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 300),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
                    child: InkWell(
                      onTap: () async {
                        final picker = ImagePicker();
                        // Future pickImage() async {
                        final pickedFile = await picker.pickImage(source: ImageSource.camera);
                        print(pickedFile?.path);
                        // }
                        setState(() {
                        });
                      },
                      child: SvgPicture.asset(Assets.icons.icOpenCamera,
                          width: 11, height: 22),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
                    child: InkWell(
                      onTap: () async {
                        List<String> listImage = await getImageGallery();
                        widget.onSelectedImage(listImage);
                      },
                      child: SvgPicture.asset(Assets.icons.icOpenGallery,
                          width: 11, height: 22),
                    ),
                  ),
                ],
              ),
            )
          : AnimatedSize(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showAttach = true;
                    });
                  },
                  child: SvgPicture.asset(Assets.icons.icChatAttach,
                      width: 11, height: 22),
                ),
              ),
            ),
    );
  }

  Future<List<String>> getImageGallery() async {
    final picker = ImagePicker();
    List<String> imageSelected = [];
    List<XFile> pickedFile = (await picker.pickMultiImage()) as List<XFile>;
    for (var element in pickedFile) {
      File file = File(element.path);
      imageSelected.add(file.path);
    }
    return imageSelected;
  }
}
