extension XString on String {
  String formatAddress() {
    return isEmpty
        ? ''
        : '${substring(0, 5)}...${substring(length - 4, length)}';
  }

  bool isValidCryptoWalletAddress() {
    return RegExp(r'^0x[a-fA-F0-9]{40}$').hasMatch(this);
  }

  bool isValidPositiveDouble() {
    return RegExp(r'^[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$').hasMatch(this);
  }

  String getEtherscanUrl({
    required String chainName,
    required String transactionHash,
  }) {
    return 'https://${chainName.toLowerCase()}.etherscan.io/tx/$transactionHash';
  }
}
