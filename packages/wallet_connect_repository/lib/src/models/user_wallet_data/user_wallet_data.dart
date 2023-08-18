import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_wallet_data.freezed.dart';

/// {@template user_wallet_data}
///  A transaction payload
/// {@endtemplate}
@freezed
class UserWalletData with _$UserWalletData {
  /// {@macro UserWalletData}
  const factory UserWalletData({
    required String walletAddress,
    required String balance,
  }) = _UserWalletData;
}
