// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chain_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChainInfo {
  int get chainId => throw _privateConstructorUsedError;
  String get chainName => throw _privateConstructorUsedError;
  String get currencySymbol => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChainInfoCopyWith<ChainInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainInfoCopyWith<$Res> {
  factory $ChainInfoCopyWith(ChainInfo value, $Res Function(ChainInfo) then) =
      _$ChainInfoCopyWithImpl<$Res, ChainInfo>;
  @useResult
  $Res call({int chainId, String chainName, String currencySymbol});
}

/// @nodoc
class _$ChainInfoCopyWithImpl<$Res, $Val extends ChainInfo>
    implements $ChainInfoCopyWith<$Res> {
  _$ChainInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chainId = null,
    Object? chainName = null,
    Object? currencySymbol = null,
  }) {
    return _then(_value.copyWith(
      chainId: null == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int,
      chainName: null == chainName
          ? _value.chainName
          : chainName // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChainInfoCopyWith<$Res> implements $ChainInfoCopyWith<$Res> {
  factory _$$_ChainInfoCopyWith(
          _$_ChainInfo value, $Res Function(_$_ChainInfo) then) =
      __$$_ChainInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int chainId, String chainName, String currencySymbol});
}

/// @nodoc
class __$$_ChainInfoCopyWithImpl<$Res>
    extends _$ChainInfoCopyWithImpl<$Res, _$_ChainInfo>
    implements _$$_ChainInfoCopyWith<$Res> {
  __$$_ChainInfoCopyWithImpl(
      _$_ChainInfo _value, $Res Function(_$_ChainInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chainId = null,
    Object? chainName = null,
    Object? currencySymbol = null,
  }) {
    return _then(_$_ChainInfo(
      chainId: null == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as int,
      chainName: null == chainName
          ? _value.chainName
          : chainName // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChainInfo implements _ChainInfo {
  const _$_ChainInfo(
      {required this.chainId,
      required this.chainName,
      required this.currencySymbol});

  @override
  final int chainId;
  @override
  final String chainName;
  @override
  final String currencySymbol;

  @override
  String toString() {
    return 'ChainInfo(chainId: $chainId, chainName: $chainName, currencySymbol: $currencySymbol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChainInfo &&
            (identical(other.chainId, chainId) || other.chainId == chainId) &&
            (identical(other.chainName, chainName) ||
                other.chainName == chainName) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, chainId, chainName, currencySymbol);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChainInfoCopyWith<_$_ChainInfo> get copyWith =>
      __$$_ChainInfoCopyWithImpl<_$_ChainInfo>(this, _$identity);
}

abstract class _ChainInfo implements ChainInfo {
  const factory _ChainInfo(
      {required final int chainId,
      required final String chainName,
      required final String currencySymbol}) = _$_ChainInfo;

  @override
  int get chainId;
  @override
  String get chainName;
  @override
  String get currencySymbol;
  @override
  @JsonKey(ignore: true)
  _$$_ChainInfoCopyWith<_$_ChainInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
