import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_crypto_demo/dashboard/dashboard.dart';
import 'package:send_crypto_demo/l10n/l10n.dart';
import 'package:send_crypto_ui/send_crypto_ui.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isLoading = context.select(
      (DashboardBloc bloc) => bloc.state.status == DashboardStatus.loading,
    );
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (_, state) {
        if (state.status == DashboardStatus.error) {
          if (state.walletConnectionStatus ==
              WalletConnectionStatus.disconnected) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: SCColors.red,
                content: Text(
                  state.errorMessage,
                ),
              ),
            );
          } else if (state.transactionStatus == TransactionStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: SCColors.red,
                content: Text(
                  state.errorMessage,
                ),
              ),
            );
          }
          context.read<DashboardBloc>().add(ResetStateRequested());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: SCSpacing.xxxlg,
          title: Text(
            localizations.sendCryptoDemo,
            style: SCTextStyle.headline3.copyWith(
              color: SCColors.blue,
            ),
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : _Body(
                localizations: localizations,
              ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.localizations,
  });

  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    final isWalletConnected = context.select(
      (DashboardBloc bloc) =>
          bloc.state.walletConnectionStatus == WalletConnectionStatus.connected,
    );

    return Column(
      children: [
        if (isWalletConnected) ...[
          const _SendTransactionWidget(),
        ] else
          Center(
            child: _ConnectWithMetamaskButton(
              localizations: localizations,
            ),
          )
      ],
    );
  }
}

class _SendTransactionWidget extends StatelessWidget {
  const _SendTransactionWidget();

  @override
  Widget build(BuildContext context) {
    final userWalletData = context.select(
      (DashboardBloc bloc) => bloc.state.userWalletData,
    );
    final chainInfo = context.select(
      (DashboardBloc bloc) => bloc.state.chainInfo,
    );

    final transactionReceipt = context.select(
      (DashboardBloc bloc) => bloc.state.transactionReceipt,
    );

    final transactionResponse = context.select(
      (DashboardBloc bloc) => bloc.state.transactionResponse,
    );

    final transactionStatus = context.select(
      (DashboardBloc bloc) => bloc.state.transactionStatus,
    );

    final recipientAddress = context.select(
      (DashboardBloc bloc) => bloc.state.recipientWalletAddress,
    );

    final amountToTransfer = context.select(
      (DashboardBloc bloc) => bloc.state.amountToTransfer,
    );
    return Column(
      children: [
        const Text('Connected with Metamask'),
        Text(
          'Chain Info : ${chainInfo?.chainName}',
        ),
        Text(
          'Wallet Address : ${userWalletData?.walletAddress ?? ''}',
        ),
        Text(
          'Wallet Balance : ${userWalletData!.balance.isEmpty ? 0 : userWalletData.balance} ${chainInfo?.currencySymbol}',
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: SCSpacing.lg,
            horizontal: SCSpacing.xlg,
          ),
          margin: EdgeInsets.symmetric(
            vertical: SCSpacing.xxlg,
            horizontal: MediaQuery.sizeOf(context).width * 0.25,
          ),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              const SizedBox(
                height: SCSpacing.xlg,
              ),
              const Text('Send Transaction'),
              const SizedBox(
                height: SCSpacing.xlg,
              ),
              SCTextFormField(
                initialValue: recipientAddress,
                label: 'Recipient Ethereum Address',
                onChanged: (val) {
                  context.read<DashboardBloc>().add(
                        RecipientWalletAddressChanged(
                          recipientWalletAddress: val,
                        ),
                      );
                },
              ),
              const SizedBox(
                height: SCSpacing.xlg,
              ),
              SCTextFormField(
                initialValue: amountToTransfer,
                label: 'Amount (Ethers)',
                onChanged: (val) {
                  context.read<DashboardBloc>().add(
                        AmountToTransferChanged(
                          amountToTransfer: val,
                        ),
                      );
                },
              ),
              const SizedBox(
                height: SCSpacing.xlg,
              ),
              SCElevatedButton.primary(
                onPressed:
                    (amountToTransfer.isEmpty || recipientAddress.isEmpty)
                        ? null
                        : () async {
                            context.read<DashboardBloc>().add(
                                  SendTokensRequested(),
                                );
                          },
                child: transactionStatus == TransactionStatus.pending
                    ? const CircularProgressIndicator()
                    : const Text('Send'),
              ),
              const SizedBox(
                height: SCSpacing.xxxlg,
              ),
              if (transactionStatus != TransactionStatus.generic) ...[
                if (transactionReceipt != null) ...[
                  Column(
                    children: [
                      Text(transactionReceipt.transactionHash),
                      Text(transactionStatus.name),
                      Text(transactionReceipt.blockNumber.toString()),
                      Text(transactionReceipt.from),
                      Text(transactionReceipt.to ?? ''),
                      Text(transactionReceipt.gasUsed.toString()),
                    ],
                  ),
                ] else if (transactionResponse != null) ...[
                  Column(
                    children: [
                      Text(transactionResponse.hash),
                      Text(transactionStatus.name),
                      Text(transactionResponse.blockNumber.toString()),
                      Text(transactionResponse.from),
                      Text(transactionResponse.to ?? ''),
                      Text(transactionResponse.gasPrice.toString()),
                    ],
                  ),
                ],
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _ConnectWithMetamaskButton extends StatelessWidget {
  const _ConnectWithMetamaskButton({
    required this.localizations,
  });

  final AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    return SCElevatedButton.primary(
      child: Text(localizations.connectToMetamask),
      onPressed: () async {
        context.read<DashboardBloc>().add(ConnectWithMetamaskRequested());
      },
    );
  }
}
