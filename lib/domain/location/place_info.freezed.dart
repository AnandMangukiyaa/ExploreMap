// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaceInfo {
  /// Address of the location
  String get address => throw _privateConstructorUsedError;

  /// City name
  String get city => throw _privateConstructorUsedError;

  /// State or province name
  String get state => throw _privateConstructorUsedError;

  /// Country name
  String get country => throw _privateConstructorUsedError;

  /// Postal code (zip code)
  String get postalCode => throw _privateConstructorUsedError;

  /// Full formatted address
  String get placeName => throw _privateConstructorUsedError;

  /// Create a copy of PlaceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceInfoCopyWith<PlaceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceInfoCopyWith<$Res> {
  factory $PlaceInfoCopyWith(PlaceInfo value, $Res Function(PlaceInfo) then) =
      _$PlaceInfoCopyWithImpl<$Res, PlaceInfo>;
  @useResult
  $Res call(
      {String address,
      String city,
      String state,
      String country,
      String postalCode,
      String placeName});
}

/// @nodoc
class _$PlaceInfoCopyWithImpl<$Res, $Val extends PlaceInfo>
    implements $PlaceInfoCopyWith<$Res> {
  _$PlaceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? postalCode = null,
    Object? placeName = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceInfoImplCopyWith<$Res>
    implements $PlaceInfoCopyWith<$Res> {
  factory _$$PlaceInfoImplCopyWith(
          _$PlaceInfoImpl value, $Res Function(_$PlaceInfoImpl) then) =
      __$$PlaceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String city,
      String state,
      String country,
      String postalCode,
      String placeName});
}

/// @nodoc
class __$$PlaceInfoImplCopyWithImpl<$Res>
    extends _$PlaceInfoCopyWithImpl<$Res, _$PlaceInfoImpl>
    implements _$$PlaceInfoImplCopyWith<$Res> {
  __$$PlaceInfoImplCopyWithImpl(
      _$PlaceInfoImpl _value, $Res Function(_$PlaceInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? postalCode = null,
    Object? placeName = null,
  }) {
    return _then(_$PlaceInfoImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlaceInfoImpl implements _PlaceInfo {
  const _$PlaceInfoImpl(
      {required this.address,
      required this.city,
      required this.state,
      required this.country,
      required this.postalCode,
      required this.placeName});

  /// Address of the location
  @override
  final String address;

  /// City name
  @override
  final String city;

  /// State or province name
  @override
  final String state;

  /// Country name
  @override
  final String country;

  /// Postal code (zip code)
  @override
  final String postalCode;

  /// Full formatted address
  @override
  final String placeName;

  @override
  String toString() {
    return 'PlaceInfo(address: $address, city: $city, state: $state, country: $country, postalCode: $postalCode, placeName: $placeName)';
  }

  @override
  Map<String, dynamic> toMap() {
    return {"address": address, "city": city, "state": state, "country": country, "postalCode": postalCode, "placeName": placeName};
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceInfoImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, address, city, state, country, postalCode, placeName);

  /// Create a copy of PlaceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceInfoImplCopyWith<_$PlaceInfoImpl> get copyWith =>
      __$$PlaceInfoImplCopyWithImpl<_$PlaceInfoImpl>(this, _$identity);
}

abstract class _PlaceInfo implements PlaceInfo {
  const factory _PlaceInfo(
      {required final String address,
      required final String city,
      required final String state,
      required final String country,
      required final String postalCode,
      required final String placeName}) = _$PlaceInfoImpl;

  /// Address of the location
  @override
  String get address;

  /// City name
  @override
  String get city;

  /// State or province name
  @override
  String get state;

  /// Country name
  @override
  String get country;

  /// Postal code (zip code)
  @override
  String get postalCode;

  /// Full formatted address
  @override
  String get placeName;

  /// Create a copy of PlaceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceInfoImplCopyWith<_$PlaceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
