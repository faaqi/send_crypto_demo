import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_crypto_demo/common/extensions/extensions.dart';
import 'package:send_crypto_demo/dashboard/dashboard.dart';
import 'package:send_crypto_demo/l10n/l10n.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';

class TransactionReceipt extends StatelessWidget {
  const TransactionReceipt({
    required this.localizations,
    required this.transactionHash,
    required this.status,
    required this.blockNumber,
    required this.from,
    required this.to,
    required this.gasUsed,
    this.statusColor = SCColors.black,
    this.showEthScanViewButton = false,
    super.key,
  });

  final AppLocalizations localizations;
  final String transactionHash;
  final String status;
  final String blockNumber;
  final String from;
  final String to;
  final String gasUsed;
  final Color statusColor;
  final bool showEthScanViewButton;

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenMeasurements(context).screenHeight;
    final screenWidth = ScreenMeasurements(context).screenWidth;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.3,
            vertical: screenHeight * 0.15,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: SCSpacing.xlg,
            horizontal: SCSpacing.xxxlg,
          ),
          child: Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: SCSpacing.xlg,
                ),
                Text(
                  localizations.transactionDetails,
                  style: SCTextStyle.headline4,
                ),
                const SizedBox(
                  height: SCSpacing.lg,
                ),
                SCTransactionReceiptTIle(
                  title: localizations.transactionHash,
                  value: transactionHash,
                  formattedValue: transactionHash.formatAddress(),
                  canBeCopied: true,
                ),
                SCTransactionReceiptTIle(
                  title: localizations.status,
                  value: status,
                  showStatusChip: true,
                  statusColor: statusColor,
                ),
                SCTransactionReceiptTIle(
                  title: localizations.blockNumber,
                  value: blockNumber,
                ),
                SCTransactionReceiptTIle(
                  title: localizations.from,
                  value: from,
                  formattedValue: from.formatAddress(),
                  canBeCopied: true,
                ),
                SCTransactionReceiptTIle(
                  title: localizations.to,
                  value: to,
                  formattedValue: to.formatAddress(),
                  canBeCopied: true,
                ),
                SCTransactionReceiptTIle(
                  title: localizations.gasUsed,
                  value: gasUsed,
                ),
                const SizedBox(
                  height: SCSpacing.lg,
                ),
                if (showEthScanViewButton) ...[
                  SizedBox(
                    width: screenWidth * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SCElevatedButton.primary(
                          width: 180,
                          height: 40,
                          onPressed: () {
                            context
                                .read<DashboardBloc>()
                                .add(ViewTransactionOnEtherscanRequested());
                          },
                          child: Text(localizations.viewOnEthScan),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        SCElevatedButton.primary(
                          width: 180,
                          height: 40,
                          onPressed: () {
                            context
                                .read<DashboardBloc>()
                                .add(ResetStateRequested());
                            Navigator.pop(context);
                          },
                          child: Text(localizations.done),
                        ),
                      ],
                    ),
                  ),
                ] else
                  SCElevatedButton.primary(
                    onPressed: () {
                      context.read<DashboardBloc>().add(ResetStateRequested());
                      Navigator.pop(context);
                    },
                    child: Text(localizations.done),
                  ),
                const SizedBox(
                  height: SCSpacing.lg,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
