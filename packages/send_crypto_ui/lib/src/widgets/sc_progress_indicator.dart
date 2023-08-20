import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';

class SCProgressIndicator extends StatelessWidget {
  const SCProgressIndicator({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      blurEffectIntensity: 4,
      progressIndicator: const SpinKitThreeInOut(
        color: SCColors.orangeAccent,
      ),
      dismissible: false,
      opacity: 0.2,
      color: SCColors.orangeAccent,
      child: child,
    );
  }
}
