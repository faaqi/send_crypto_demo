// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';

class SCCopyToClipBoardIcon extends StatelessWidget {
  const SCCopyToClipBoardIcon({
    required this.value,
    required this.buildContext,
    this.iconSize = SCSpacing.lg,
    super.key,
  });

  final BuildContext buildContext;
  final String value;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: value)).then((_) {
          ScaffoldMessenger.of(buildContext).showSnackBar(
            const SnackBar(
              content: Text('Copied to your clipboard !'),
            ),
          );
        });
      },
      child: Icon(
        Icons.copy,
        size: iconSize,
      ),
    );
  }
}
