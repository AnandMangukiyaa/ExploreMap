// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationState {
  LocationModel get userLocation => throw _privateConstructorUsedError;
  List<Marker> get markers => throw _privateConstructorUsedError;
  PlaceInfo get placeInfo => throw _privateConstructorUsedError;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationStateCopyWith<LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res, LocationState>;
  @useResult
  $Res call(
      {LocationModel userLocation, List<Marker> markers, PlaceInfo placeInfo});

  $LocationModelCopyWith<$Res> get userLocation;
  $PlaceInfoCopyWith<$Res> get placeInfo;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res, $Val extends LocationState>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLocation = null,
    Object? markers = null,
    Object? placeInfo = null,
  }) {
    return _then(_value.copyWith(
      userLocation: null == userLocation
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      placeInfo: null == placeInfo
          ? _value.placeInfo
          : placeInfo // ignore: cast_nullable_to_non_nullable
              as PlaceInfo,
    ) as $Val);
  }

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res> get userLocation {
    return $LocationModelCopyWith<$Res>(_value.userLocation, (value) {
      return _then(_value.copyWith(userLocation: value) as $Val);
    });
  }

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceInfoCopyWith<$Res> get placeInfo {
    return $PlaceInfoCopyWith<$Res>(_value.placeInfo, (value) {
      return _then(_value.copyWith(placeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationStateImplCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$$LocationStateImplCopyWith(
          _$LocationStateImpl value, $Res Function(_$LocationStateImpl) then) =
      __$$LocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LocationModel userLocation, List<Marker> markers, PlaceInfo placeInfo});

  @override
  $LocationModelCopyWith<$Res> get userLocation;
  @override
  $PlaceInfoCopyWith<$Res> get placeInfo;
}

/// @nodoc
class __$$LocationStateImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$LocationStateImpl>
    implements _$$LocationStateImplCopyWith<$Res> {
  __$$LocationStateImplCopyWithImpl(
      _$LocationStateImpl _value, $Res Function(_$LocationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLocation = null,
    Object? markers = null,
    Object? placeInfo = null,
  }) {
    return _then(_$LocationStateImpl(
      userLocation: null == userLocation
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      placeInfo: null == placeInfo
          ? _value.placeInfo
          : placeInfo // ignore: cast_nullable_to_non_nullable
              as PlaceInfo,
    ));
  }
}

/// @nodoc

class _$LocationStateImpl extends _LocationState {
  const _$LocationStateImpl(
      {required this.userLocation,
      required final List<Marker> markers,
      required this.placeInfo})
      : _markers = markers,
        super._();

  @override
  final LocationModel userLocation;
  final List<Marker> _markers;
  @override
  List<Marker> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  @override
  final PlaceInfo placeInfo;

  @override
  String toString() {
    return 'LocationState(userLocation: $userLocation, markers: $markers, placeInfo: $placeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationStateImpl &&
            (identical(other.userLocation, userLocation) ||
                other.userLocation == userLocation) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.placeInfo, placeInfo) ||
                other.placeInfo == placeInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userLocation,
      const DeepCollectionEquality().hash(_markers), placeInfo);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      __$$LocationStateImplCopyWithImpl<_$LocationStateImpl>(this, _$identity);
}

abstract class _LocationState extends LocationState {
  const factory _LocationState(
      {required final LocationModel userLocation,
      required final List<Marker> markers,
      required final PlaceInfo placeInfo}) = _$LocationStateImpl;
  const _LocationState._() : super._();

  @override
  LocationModel get userLocation;
  @override
  List<Marker> get markers;
  @override
  PlaceInfo get placeInfo;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
