

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageWidget extends StatefulWidget {
  final String content;
  final String title;
  final String? icon;
  final int? backgroundColor;

  MessageWidget(
      {Key? key,
        required this.title,
        required this.content,
        this.icon,
        this.backgroundColor})
      : super(key: key);

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
    return Dialog(
      backgroundColor: Color(widget.backgroundColor ?? 0xff34A853),
      elevation: 0,
      alignment: Alignment.topCenter,
      insetPadding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.icon != null && widget.icon!.isNotEmpty)
              SvgPicture.asset(widget.icon!, width: 40, height: 40),
            const SizedBox(height: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20),
                ),
                const SizedBox(height: 8),
                if (widget.content.isNotEmpty)
                  Text(
                    widget.content,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
