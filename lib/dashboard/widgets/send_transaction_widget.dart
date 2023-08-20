import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_crypto_demo/common/common.dart';
import 'package:send_crypto_demo/dashboard/dashboard.dart';
import 'package:send_crypto_demo/l10n/l10n.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';

class SendTransactionWidget extends StatelessWidget {
  const SendTransactionWidget({
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
    final transactionStatus = context.select(
      (DashboardBloc bloc) => bloc.state.transactionStatus,
    );

    final recipientAddress = context.select(
      (DashboardBloc bloc) => bloc.state.recipientWalletAddress,
    );

    return Container(
      width: screenWidth * 0.5,
      padding: const EdgeInsets.symmetric(
        vertical: SCSpacing.lg,
        horizontal: SCSpacing.xlg,
      ),
      decoration: const BoxDecoration(),
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: SCSpacing.xxlg,
          horizontal: screenWidth * 0.05,
        ),
        color: SCColors.black,
        child: Padding(
          padding: const EdgeInsets.all(SCSpacing.xlg),
          child: Column(
            children: [
              const SizedBox(
                height: SCSpacing.xxlg,
              ),
              Text(
                localizations.sendCrypto,
                style: SCTextStyle.headline4.copyWith(
                  color: SCColors.orangeAccent,
                ),
              ),
              const SizedBox(
                height: SCSpacing.xxxlg,
              ),
              _WalletAddressTextField(
                recipientAddress: recipientAddress,
                localizations: localizations,
              ),
              const SizedBox(
                height: SCSpacing.xlg,
              ),
              _AmountTextField(
                localizations: localizations,
              ),
              const SizedBox(
                height: SCSpacing.xxxlg,
              ),
              _SendTokensButton(
                recipientAddress: recipientAddress,
                transactionStatus: transactionStatus,
                localizations: localizations,
              ),
              const SizedBox(
                height: SCSpacing.xxxxlg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AmountTextField extends StatelessWidget {
  const _AmountTextField({
    required this.localizations,
  });

  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    final balance = context.select(
      (DashboardBloc bloc) => bloc.state.userWalletData!.balance,
    );
    final amountToTransfer = context.select(
      (DashboardBloc bloc) => bloc.state.amountToTransfer,
    );

    final insufficientBalance = balance.isNotEmpty &&
        (num.tryParse(balance) ?? 0) < (num.tryParse(amountToTransfer) ?? 0);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.25,
      child: SCTextFormField(
        initialValue: amountToTransfer,
        label: localizations.amount,
        errorText: amountToTransfer.isNotEmpty &&
                !amountToTransfer.isValidPositiveDouble()
            ? localizations.enterValidAmountETH
            : insufficientBalance
                ? 'Insufficient Balance'
                : null,
        textStyle: SCTextStyle.bodyText1.copyWith(
          color: SCColors.orangeAccent,
        ),
        themeColor: SCColors.orangeAccent,
        onChanged: (val) {
          context.read<DashboardBloc>().add(
                AmountToTransferChanged(
                  amountToTransfer: val,
                ),
              );
        },
      ),
    );
  }
}

class _WalletAddressTextField extends StatelessWidget {
  const _WalletAddressTextField({
    required this.recipientAddress,
    required this.localizations,
  });

  final String recipientAddress;
  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.25,
      child: SCTextFormField(
        initialValue: recipientAddress,
        label: localizations.publicWalletAddress,
        errorText: recipientAddress.isNotEmpty &&
                !recipientAddress.isValidCryptoWalletAddress()
            ? localizations.enterValidWalletAddress
            : null,
        textStyle: SCTextStyle.bodyText1.copyWith(
          color: SCColors.orangeAccent,
        ),
        themeColor: SCColors.orangeAccent,
        onChanged: (val) {
          context.read<DashboardBloc>().add(
                RecipientWalletAddressChanged(
                  recipientWalletAddress: val,
                ),
              );
        },
      ),
    );
  }
}

class _SendTokensButton extends StatelessWidget {
  const _SendTokensButton({
    required this.recipientAddress,
    required this.transactionStatus,
    required this.localizations,
  });

  final String recipientAddress;
  final TransactionStatus transactionStatus;
  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    final amountToTransfer = context.select(
      (DashboardBloc bloc) => bloc.state.amountToTransfer,
    );
    final balance = context.select(
      (DashboardBloc bloc) => bloc.state.userWalletData!.balance,
    );

    final insufficientBalance = balance.isNotEmpty &&
        (num.tryParse(balance) ?? 0) < (num.tryParse(amountToTransfer) ?? 0);
    final isDisabled = !amountToTransfer.isValidPositiveDouble() ||
        !recipientAddress.isValidCryptoWalletAddress() ||
        insufficientBalance;
    return SCElevatedButton.primary(
      backgroundColor: isDisabled ? SCColors.grey : SCColors.orangeAccent,
      foregroundColor: SCColors.black,
      onPressed: isDisabled
          ? () {}
          : () async {
              context.read<DashboardBloc>().add(
                    SendTokensRequested(),
                  );
            },
      child: transactionStatus == TransactionStatus.pending
          ? const CircularProgressIndicator()
          : Text(
              localizations.send,
              style: SCTextStyle.button.copyWith(
                fontWeight: SCFontWeight.bold,
              ),
            ),
    );
  }
}
