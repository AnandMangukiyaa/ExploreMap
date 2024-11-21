import 'package:flutter_assignment1/domain/location/place_info.dart';

import 'location_model.dart';

abstract class ILocationService {
  Stream<LocationModel> get positionStream;
  Future<PlaceInfo?> getPlaceFromLatLong(String lat, String long);
}
