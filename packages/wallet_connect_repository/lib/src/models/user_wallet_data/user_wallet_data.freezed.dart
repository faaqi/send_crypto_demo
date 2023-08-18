// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_wallet_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserWalletData {
  String get walletAddress => throw _privateConstructorUsedError;
  String get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserWalletDataCopyWith<UserWalletData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWalletDataCopyWith<$Res> {
  factory $UserWalletDataCopyWith(
          UserWalletData value, $Res Function(UserWalletData) then) =
      _$UserWalletDataCopyWithImpl<$Res, UserWalletData>;
  @useResult
  $Res call({String walletAddress, String balance});
}

/// @nodoc
class _$UserWalletDataCopyWithImpl<$Res, $Val extends UserWalletData>
    implements $UserWalletDataCopyWith<$Res> {
  _$UserWalletDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletAddress = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserWalletDataCopyWith<$Res>
    implements $UserWalletDataCopyWith<$Res> {
  factory _$$_UserWalletDataCopyWith(
          _$_UserWalletData value, $Res Function(_$_UserWalletData) then) =
      __$$_UserWalletDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String walletAddress, String balance});
}

/// @nodoc
class __$$_UserWalletDataCopyWithImpl<$Res>
    extends _$UserWalletDataCopyWithImpl<$Res, _$_UserWalletData>
    implements _$$_UserWalletDataCopyWith<$Res> {
  __$$_UserWalletDataCopyWithImpl(
      _$_UserWalletData _value, $Res Function(_$_UserWalletData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletAddress = null,
    Object? balance = null,
  }) {
    return _then(_$_UserWalletData(
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserWalletData implements _UserWalletData {
  const _$_UserWalletData({required this.walletAddress, required this.balance});

  @override
  final String walletAddress;
  @override
  final String balance;

  @override
  String toString() {
    return 'UserWalletData(walletAddress: $walletAddress, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserWalletData &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, walletAddress, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserWalletDataCopyWith<_$_UserWalletData> get copyWith =>
      __$$_UserWalletDataCopyWithImpl<_$_UserWalletData>(this, _$identity);
}

abstract class _UserWalletData implements UserWalletData {
  const factory _UserWalletData(
      {required final String walletAddress,
      required final String balance}) = _$_UserWalletData;

  @override
  String get walletAddress;
  @override
  String get balance;
  @override
  @JsonKey(ignore: true)
  _$$_UserWalletDataCopyWith<_$_UserWalletData> get copyWith =>
      throw _privateConstructorUsedError;
}
