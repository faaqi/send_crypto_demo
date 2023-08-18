// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionPayload {
  String get recipientWalletAddress => throw _privateConstructorUsedError;
  num get amuntToTransfer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionPayloadCopyWith<TransactionPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionPayloadCopyWith<$Res> {
  factory $TransactionPayloadCopyWith(
          TransactionPayload value, $Res Function(TransactionPayload) then) =
      _$TransactionPayloadCopyWithImpl<$Res, TransactionPayload>;
  @useResult
  $Res call({String recipientWalletAddress, num amuntToTransfer});
}

/// @nodoc
class _$TransactionPayloadCopyWithImpl<$Res, $Val extends TransactionPayload>
    implements $TransactionPayloadCopyWith<$Res> {
  _$TransactionPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipientWalletAddress = null,
    Object? amuntToTransfer = null,
  }) {
    return _then(_value.copyWith(
      recipientWalletAddress: null == recipientWalletAddress
          ? _value.recipientWalletAddress
          : recipientWalletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amuntToTransfer: null == amuntToTransfer
          ? _value.amuntToTransfer
          : amuntToTransfer // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionPayloadCopyWith<$Res>
    implements $TransactionPayloadCopyWith<$Res> {
  factory _$$_TransactionPayloadCopyWith(_$_TransactionPayload value,
          $Res Function(_$_TransactionPayload) then) =
      __$$_TransactionPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String recipientWalletAddress, num amuntToTransfer});
}

/// @nodoc
class __$$_TransactionPayloadCopyWithImpl<$Res>
    extends _$TransactionPayloadCopyWithImpl<$Res, _$_TransactionPayload>
    implements _$$_TransactionPayloadCopyWith<$Res> {
  __$$_TransactionPayloadCopyWithImpl(
      _$_TransactionPayload _value, $Res Function(_$_TransactionPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipientWalletAddress = null,
    Object? amuntToTransfer = null,
  }) {
    return _then(_$_TransactionPayload(
      recipientWalletAddress: null == recipientWalletAddress
          ? _value.recipientWalletAddress
          : recipientWalletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amuntToTransfer: null == amuntToTransfer
          ? _value.amuntToTransfer
          : amuntToTransfer // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$_TransactionPayload implements _TransactionPayload {
  const _$_TransactionPayload(
      {required this.recipientWalletAddress, required this.amuntToTransfer});

  @override
  final String recipientWalletAddress;
  @override
  final num amuntToTransfer;

  @override
  String toString() {
    return 'TransactionPayload(recipientWalletAddress: $recipientWalletAddress, amuntToTransfer: $amuntToTransfer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionPayload &&
            (identical(other.recipientWalletAddress, recipientWalletAddress) ||
                other.recipientWalletAddress == recipientWalletAddress) &&
            (identical(other.amuntToTransfer, amuntToTransfer) ||
                other.amuntToTransfer == amuntToTransfer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, recipientWalletAddress, amuntToTransfer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionPayloadCopyWith<_$_TransactionPayload> get copyWith =>
      __$$_TransactionPayloadCopyWithImpl<_$_TransactionPayload>(
          this, _$identity);
}

abstract class _TransactionPayload implements TransactionPayload {
  const factory _TransactionPayload(
      {required final String recipientWalletAddress,
      required final num amuntToTransfer}) = _$_TransactionPayload;

  @override
  String get recipientWalletAddress;
  @override
  num get amuntToTransfer;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionPayloadCopyWith<_$_TransactionPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
