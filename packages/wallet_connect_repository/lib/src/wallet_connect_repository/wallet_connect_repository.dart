// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:wallet_connect_repository/wallet_connect_repository.dart';

class WalletConnectRepository implements WalletConnectRepositoryBase {
  WalletConnectRepository();

  //// connect with metamask
  @override
  Future<String> connectWithMetamask() async {
    if (ethereum != null) {
      try {
        final accs = await ethereum!.requestAccount();

        return accs.first;
      } on EthereumUserRejected {
        throw Exception('Metamask Integration Cancelled');
      } on Exception catch (e) {
        throw Exception(e);
      }
    } else {
      throw Exception('Web3 not supported');
    }
  }

  @override
  Future<int> getChainId() async {
    final chainId = await ethereum!.getChainId();

    return chainId;
  }

  Future<int> onChainChangedListener() async {
    final completer = Completer<int>();

    ethereum!.onChainChanged(completer.complete);
    return completer.future;
  }

  Future<List<String>> onAccountChangedListener() {
    final completer = Completer<List<String>>();

    ethereum!.onAccountsChanged(completer.complete);
    return completer.future;
  }

  @override
  Future<String> fetchWalletBalance({required String walletAddress}) async {
    if (ethereum != null) {
      try {
        final bigIntBalance = await provider!.getBalance(walletAddress);
        final balance = bigIntBalance / BigInt.from(10).pow(18);
        return balance.toString();
      } catch (e) {
        return '';
      }
    } else {
      return '';
    }
  }

  @override
  Future<TransactionResponse?> sendTransaction({
    required String toAddress,
    required num amount,
  }) async {
    try {
      final token = ContractERC20(toAddress, provider!.getSigner());

      final amountInWei = BigInt.from(amount * 1000000000000000000);

      // Convert the amount to the token's smallest unit
      final amountInSmallestUnit = amountInWei * BigInt.from(10).pow(18);

      print(amountInSmallestUnit);

      final transaction = await token.transfer(toAddress, amountInSmallestUnit);

      return transaction;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<TransactionReceipt?> getTransactionReceipt({
    required TransactionResponse transaction,
  }) async {
    try {
      final receipt = await transaction.wait();
      return receipt;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
