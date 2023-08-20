// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_crypto_demo/common/common.dart';
import 'package:send_crypto_demo/dashboard/dashboard.dart';
import 'package:send_crypto_demo/l10n/l10n.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';

class UserWalletInfo extends StatelessWidget {
  const UserWalletInfo({
    required this.screenHeight,
    required this.screenWidth,
    required this.localizations,
    super.key,
  });

  final double screenHeight;
  final double screenWidth;
  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    final userWalletData = context.select(
      (DashboardBloc bloc) => bloc.state.userWalletData,
    );
    final chainInfo = context.select(
      (DashboardBloc bloc) => bloc.state.chainInfo,
    );

    return Container(
      color: SCColors.black,
      height: screenHeight,
      width: screenWidth * 0.5,
      padding: const EdgeInsets.symmetric(
        vertical: SCSpacing.xxlg,
        horizontal: SCSpacing.xxxlg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.sendCryptoDemo,
            style: SCTextStyle.headline4.copyWith(
              color: SCColors.orangeAccent,
              fontWeight: SCFontWeight.bold,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.2,
          ),
          Card(
            margin: EdgeInsets.symmetric(
              vertical: SCSpacing.xlg,
              horizontal: screenWidth * 0.05,
            ),
            color: SCColors.orangeAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: SCSpacing.xlg,
                horizontal: SCSpacing.xxlg,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: SCSpacing.xlg,
                  ),
                  Text(
                    localizations.accountDetails,
                    style: SCTextStyle.headline5.copyWith(
                      fontWeight: SCFontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: SCSpacing.xxlg,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localizations.connectedNetwork,
                        style: SCTextStyle.bodyText1,
                      ),
                      Text(
                        '${chainInfo?.chainName}',
                        style: SCTextStyle.bodyText1.copyWith(
                          fontWeight: SCFontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SCSpacing.xlg,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localizations.walletAddress,
                        style: SCTextStyle.bodyText1,
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              userWalletData?.walletAddress.formatAddress() ??
                                  '',
                              style: SCTextStyle.bodyText1.copyWith(
                                fontWeight: SCFontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: SCSpacing.sm,
                            ),
                            SCCopyToClipBoardIcon(
                              value: userWalletData!.walletAddress,
                              buildContext: context,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SCSpacing.xlg,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localizations.walletBalance,
                        style: SCTextStyle.bodyText1,
                      ),
                      Text(
                        '${userWalletData.balance.isEmpty ? 0 : userWalletData.balance} ${chainInfo?.currencySymbol}',
                        style: SCTextStyle.bodyText1.copyWith(
                          fontWeight: SCFontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SCSpacing.xlg,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
