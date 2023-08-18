import 'package:send_crypto_ui/send_crypto_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SCIconsLight extends SCIcon {
  @override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? SCColors.black,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture emailOutline({double? size, Color? color}) {
    return super.emailOutline(
      color: color ?? SCColors.black,
      size: size ?? 14,
    );
  }
}
