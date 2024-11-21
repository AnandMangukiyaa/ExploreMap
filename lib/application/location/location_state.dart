part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    required LocationModel userLocation,
    required List<Marker> markers,
    required PlaceInfo placeInfo,
  }) = _LocationState;
  factory LocationState.initial() => LocationState(
        userLocation: LocationModel.empty(),
        markers: [],
        placeInfo: PlaceInfo.empty()
      );
  const LocationState._();
  bool get isUserLocationReady => userLocation != LocationModel.empty();
}
