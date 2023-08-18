import 'package:freezed_annotation/freezed_annotation.dart';

part 'chain_info.freezed.dart';

/// {@template chain_info}
///  A chain in context of blockchain.
/// {@endtemplate}
@freezed
class ChainInfo with _$ChainInfo {
  /// {@macro ChainInfo}
  const factory ChainInfo({
    required int chainId,
    required String chainName,
    required String currencySymbol,
  }) = _ChainInfo;
}
