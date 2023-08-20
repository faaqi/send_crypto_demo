import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_crypto_demo/common/common.dart';
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
        if (state.status == DashboardStatus.loaded) {
          if (state.transactionStatus != TransactionStatus.generic) {
            /// Close any already opened dialog if any
            if (_isThereCurrentDialogShowing(context)) {
              Navigator.pop(context);
            }

            showDialog<dynamic>(
              barrierDismissible: false,
              context: context,
              builder: (_) {
                var statusColor = SCColors.black;

                switch (state.transactionStatus) {
                  case TransactionStatus.pending:
                    statusColor = SCColors.orangeAccent;
                  case TransactionStatus.success:
                    statusColor = Colors.green;
                  case TransactionStatus.failed:
                    statusColor = SCColors.red;
                  case TransactionStatus.generic:
                    statusColor = SCColors.black;
                }
                if (state.transactionReceipt != null) {
                  final transactionReceipt = state.transactionReceipt!;

                  return BlocProvider<DashboardBloc>.value(
                    value: context.read<DashboardBloc>(),
                    child: TransactionReceipt(
                      localizations: localizations,
                      transactionHash: transactionReceipt.transactionHash,
                      status: state.transactionStatus.name,
                      statusColor: statusColor,
                      blockNumber: transactionReceipt.blockNumber.toString(),
                      from: transactionReceipt.from,
                      to: transactionReceipt.to ?? '',
                      gasUsed: transactionReceipt.gasUsed.toString(),
                      showEthScanViewButton: true,
                    ),
                  );
                } else if (state.transactionResponse != null) {
                  final transactionResponse = state.transactionResponse!;

                  return BlocProvider<DashboardBloc>.value(
                    value: context.read<DashboardBloc>(),
                    child: TransactionReceipt(
                      localizations: localizations,
                      transactionHash: transactionResponse.hash,
                      status: state.transactionStatus.name,
                      statusColor: statusColor,
                      blockNumber: transactionResponse.blockNumber == null
                          ? ''
                          : transactionResponse.blockNumber.toString(),
                      from: transactionResponse.from,
                      to: transactionResponse.to ?? '',
                      gasUsed: transactionResponse.gasLimit.toString(),
                    ),
                  );
                }

                return const SizedBox();
              },
            );
          }
        } else if (state.status == DashboardStatus.error) {
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
      child: SCProgressIndicator(
        isLoading: isLoading,
        child: Scaffold(
          body: _Body(
            localizations: localizations,
          ),
        ),
      ),
    );
  }

  bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
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

    final screenHeight = ScreenMeasurements(context).screenHeight;
    final screenWidth = ScreenMeasurements(context).screenWidth;

    return Column(
      children: [
        if (isWalletConnected) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UserWalletInfo(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                localizations: localizations,
              ),
              SendTransactionWidget(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                localizations: localizations,
              ),
            ],
          ),
        ] else
          Center(
            child: ConnectWithMetamaskView(
              localizations: localizations,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
          )
      ],
    );
  }
}
