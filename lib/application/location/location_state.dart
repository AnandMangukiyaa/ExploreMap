part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    required LocationModel userLocation,
    required List<Marker> markers
  }) = _LocationState;
  factory LocationState.initial() => LocationState(
        userLocation: LocationModel.empty(),
        markers: []
      );
  const LocationState._();
  bool get isUserLocationReady => userLocation != LocationModel.empty();
}
