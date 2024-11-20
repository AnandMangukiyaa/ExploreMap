import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_assignment1/domain/location/i_location_service.dart';
import 'package:flutter_assignment1/domain/location/location_model.dart';

@Injectable(as: ILocationService)
class GeolocatorLocationService implements ILocationService {
  @override
  Stream<LocationModel> get positionStream => Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      )).map((Position position) => LocationModel(
          latitude: position.latitude, longitude: position.longitude));
}
