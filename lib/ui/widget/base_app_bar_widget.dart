

import 'dart:developer' as developer;
import 'package:chat_app_flutter/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';

class BaseAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final PreferredSizeWidget? top;
  final Widget? leading;
  final Widget? avatar;
  final Widget? title;
  final Widget? action;
  final bool showLineBottom;

  const BaseAppBarWidget({Key? key, this.bottom, this.leading, this.title, this.avatar, this.action, this.top, this.showLineBottom = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            if (top != null) top!,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                leading ??
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(Assets.icons.icBack,
                            width: 200, height: 24)),
                const SizedBox(width:12),
                avatar ?? Container(),
                const SizedBox(width: 12),
                Expanded(
                  child: title ?? Container(),
                ),
                const SizedBox(width: 8),
                action ?? const SizedBox.shrink(),
                const SizedBox(width: 16),
              ],
            ),
            if (bottom != null) bottom!,
            const SizedBox(height: 10),
            if (showLineBottom)
              Container(
                height: 0.2,
                color: ColorConstants.textColor,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + 20 + (bottom?.preferredSize.height ?? 0) + (top?.preferredSize.height ?? 0),);
}
