import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_crypto_demo/dashboard/dashboard.dart';
import 'package:send_crypto_demo/l10n/l10n.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';

class ConnectWithMetamaskView extends StatelessWidget {
  const ConnectWithMetamaskView({
    required this.localizations,
    required this.screenHeight,
    required this.screenWidth,
    super.key,
  });

  final AppLocalizations localizations;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        color: SCColors.black,
        image: DecorationImage(
          image: SCImages().background().image,
          fit: BoxFit.cover,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.1,
          horizontal: screenWidth * 0.25,
        ),
        color: SCColors.black,
        child: Padding(
          padding: const EdgeInsets.all(SCSpacing.xlg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: SCSpacing.xlg,
              ),
              Text(
                'Send Crypto Tokens Instantly',
                style: SCTextStyle.headline1.copyWith(
                  color: SCColors.orangeAccent,
                ),
              ),
              Flexible(child: SCImages().metamastLogo()),
              SCElevatedButton.primary(
                backgroundColor: SCColors.orangeAccent,
                foregroundColor: SCColors.black,
                child: Text(localizations.connectToMetamask),
                onPressed: () async {
                  context
                      .read<DashboardBloc>()
                      .add(ConnectWithMetamaskRequested());
                },
              ),
              const SizedBox(
                height: SCSpacing.xlg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
