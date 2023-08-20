import 'package:flutter/material.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';

class SCTransactionReceiptTIle extends StatelessWidget {
  const SCTransactionReceiptTIle({
    required this.title,
    required this.value,
    this.formattedValue,
    this.showStatusChip = false,
    this.statusColor = SCColors.black,
    this.canBeCopied = false,
    super.key,
  });

  final String title;
  final String value;
  final String? formattedValue;
  final bool showStatusChip;
  final Color statusColor;
  final bool canBeCopied;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: SCSpacing.lg,
        horizontal: SCSpacing.xlg,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: SCSpacing.xlg,
      ),
      decoration: const BoxDecoration(
        color: SCColors.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(SCSpacing.md)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: SCTextStyle.bodyText1.copyWith(
              fontWeight: SCFontWeight.bold,
            ),
          ),
          if (canBeCopied) ...[
            SizedBox(
              width: screenWidth * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    formattedValue ?? value,
                    style: SCTextStyle.bodyText1.copyWith(
                      fontWeight: SCFontWeight.bold,
                      color: showStatusChip ? statusColor : statusColor,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.01,
                  ),
                  SCCopyToClipBoardIcon(
                    value: value,
                    buildContext: context,
                  )
                ],
              ),
            ),
          ] else
            Text(
              value,
              style: SCTextStyle.bodyText1.copyWith(
                fontWeight: SCFontWeight.bold,
                color: showStatusChip ? statusColor : statusColor,
              ),
            ),
        ],
      ),
    );
  }
}
