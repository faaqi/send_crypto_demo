import 'package:flutter_web3/flutter_web3.dart';

/// {@template wallet_connect_repository_base}
/// Repository for implementing the WalletConnect Methods
/// {@endtemplate}
///
abstract class WalletConnectRepositoryBase {
  Future<String> connectWithMetamask();

  Future<int> getChainId();

  Future<String> fetchWalletBalance({required String walletAddress});

  Future<TransactionResponse?> sendTransaction({
    required String toAddress,
    required num amount,
  });

  Future<TransactionReceipt?> getTransactionReceipt({
    required TransactionResponse transaction,
  });
}
