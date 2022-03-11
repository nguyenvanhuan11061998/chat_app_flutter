

import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

class AppButtonWidget extends ElevatedButton {
  AppButtonWidget(
      {Key? key,
        String? title,
        Widget? child,
        BorderRadiusGeometry? borderRadius,
        Color? color,
        Color? borderColor,
        VoidCallback? onPressed})
      : super(
      key: key,
      child: child ??
          Text(
            title ?? '',
            style: TextStyle(
                color: onPressed != null
                    ? borderColor ?? Colors.white
                    : const Color(0xff7A7AD9),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'SVNGilroy'
            ),
          ),
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (states) {
            return RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              side: BorderSide(
                  color: onPressed != null
                      ? borderColor ?? ColorConstants.primaryColor
                      : Colors.grey),
            );
          },
        ),
        backgroundColor:
        MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return const Color(0xffF2F2F2); // Disabled color
          }
          return color ??  ColorConstants.primaryColor; // Regular color
        }),
      ));
}
