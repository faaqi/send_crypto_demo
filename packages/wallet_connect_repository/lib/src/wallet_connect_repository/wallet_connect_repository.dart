// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'dart:math';

import 'package:url_launcher/url_launcher.dart';
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
        return balance.toStringAsFixed(4);
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

      final amountToTransfer = amount * pow(10, 18);

      final amountinBigInt = BigInt.from(amountToTransfer);

      final hexValue = '0x${amountinBigInt.toRadixString(16)}';

      final gasLimit = await token.contract.estimateGas(
        'transfer',
        [toAddress, hexValue],
      );

      final gasPrice = await provider!.getGasPrice();

      final transaction = await token.contract.send(
        'transfer',
        [toAddress, hexValue],
        TransactionOverride(
          gasPrice: gasPrice,
          gasLimit: gasLimit,
        ),
      );

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

  @override
  Future<void> launchURL({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
