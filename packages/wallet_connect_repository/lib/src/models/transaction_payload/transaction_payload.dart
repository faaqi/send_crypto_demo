import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_payload.freezed.dart';

/// {@template transaction_payload}
///  A transaction payload
/// {@endtemplate}
@freezed
class TransactionPayload with _$TransactionPayload {
  /// {@macro TransactionPayload}
  const factory TransactionPayload({
    required String recipientWalletAddress,
    required num amuntToTransfer,
  }) = _TransactionPayload;
}
