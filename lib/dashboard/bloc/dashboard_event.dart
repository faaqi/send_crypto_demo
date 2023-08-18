part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class ConnectWithMetamaskRequested extends DashboardEvent {}

class ChainIDFetched extends DashboardEvent {}

class OnChainChangedListener extends DashboardEvent {}

class OnAccountChangedListener extends DashboardEvent {}

class FetchWalletBalanceRequested extends DashboardEvent {
  const FetchWalletBalanceRequested({required this.walletAddress});

  final String walletAddress;

  @override
  List<Object?> get props => [walletAddress];
}

class RecipientWalletAddressChanged extends DashboardEvent {
  const RecipientWalletAddressChanged({required this.recipientWalletAddress});

  final String recipientWalletAddress;

  @override
  List<Object?> get props => [recipientWalletAddress];
}

class AmountToTransferChanged extends DashboardEvent {
  const AmountToTransferChanged({required this.amountToTransfer});

  final String amountToTransfer;

  @override
  List<Object?> get props => [amountToTransfer];
}

class SendTokensRequested extends DashboardEvent {}

class TransactionReceiptFetched extends DashboardEvent {}

class ResetStateRequested extends DashboardEvent {}
