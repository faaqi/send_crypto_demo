import 'package:wallet_connect_repository/wallet_connect_repository.dart';

class WCConstants {
  static const List<ChainInfo> supportedChains = [
    ChainInfo(chainId: 1, chainName: 'Ethereum Mainnet', currencySymbol: 'ETH'),
    ChainInfo(
      chainId: 59144,
      chainName: 'Linea Mainnet',
      currencySymbol: 'ETH',
    ),
    ChainInfo(
      chainId: 137,
      chainName: 'Polygon Mainnet',
      currencySymbol: 'MATIC',
    ),
    ChainInfo(chainId: 5, chainName: 'Goerli', currencySymbol: 'GoerliETH'),
    ChainInfo(
      chainId: 11155111,
      chainName: 'Sepolia',
      currencySymbol: 'SepoliaETH',
    ),
  ];
}
