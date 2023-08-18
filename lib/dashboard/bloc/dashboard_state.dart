part of 'dashboard_bloc.dart';

enum DashboardStatus {
  initial,
  loading,
  loaded,
  error,
}

enum WalletConnectionStatus {
  generic,
  connected,
  disconnected,
}

enum TransactionStatus {
  generic,
  pending,
  successful,
  failed,
}

class DashboardState extends Equatable {
  const DashboardState({
    required this.status,
    this.walletConnectionStatus = WalletConnectionStatus.generic,
    this.transactionStatus = TransactionStatus.generic,
    this.chainInfo,
    this.userWalletData,
    this.recipientWalletAddress = '',
    this.amountToTransfer = '',
    this.transactionResponse,
    this.transactionReceipt,
    this.errorMessage = '',
  });

  const DashboardState.initial()
      : this(
          status: DashboardStatus.initial,
        );

  final DashboardStatus status;
  final WalletConnectionStatus walletConnectionStatus;
  final TransactionStatus transactionStatus;
  final ChainInfo? chainInfo;
  final UserWalletData? userWalletData;
  final String recipientWalletAddress;
  final String amountToTransfer;
  final TransactionResponse? transactionResponse;
  final TransactionReceipt? transactionReceipt;
  final String errorMessage;

  DashboardState copyWith({
    DashboardStatus? status,
    WalletConnectionStatus? walletConnectionStatus,
    TransactionStatus? transactionStatus,
    ChainInfo? chainInfo,
    UserWalletData? userWalletData,
    String? recipientWalletAddress,
    String? amountToTransfer,
    TransactionResponse? transactionResponse,
    TransactionReceipt? transactionReceipt,
    String? errorMessage,
  }) {
    return DashboardState(
      status: status ?? this.status,
      walletConnectionStatus:
          walletConnectionStatus ?? this.walletConnectionStatus,
      transactionStatus: transactionStatus ?? this.transactionStatus,
      chainInfo: chainInfo ?? this.chainInfo,
      userWalletData: userWalletData ?? this.userWalletData,
      recipientWalletAddress:
          recipientWalletAddress ?? this.recipientWalletAddress,
      amountToTransfer: amountToTransfer ?? this.amountToTransfer,
      transactionResponse: transactionResponse ?? this.transactionResponse,
      transactionReceipt: transactionReceipt ?? this.transactionReceipt,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        walletConnectionStatus,
        transactionStatus,
        chainInfo,
        userWalletData,
        recipientWalletAddress,
        amountToTransfer,
        transactionResponse,
        transactionReceipt,
        errorMessage,
      ];
}
