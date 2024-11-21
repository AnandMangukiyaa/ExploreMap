import 'dart:convert';

import 'package:flutter_assignment1/domain/location/place_info.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_assignment1/domain/location/i_location_service.dart';
import 'package:flutter_assignment1/domain/location/location_model.dart';
import 'package:http/http.dart' as http;

@Injectable(as: ILocationService)
class GeolocatorLocationService implements ILocationService {
  @override
  Stream<LocationModel> get positionStream => Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      )).map((Position position) => LocationModel(latitude: position.latitude, longitude: position.longitude));

  @override
  Future<PlaceInfo?> getPlaceFromLatLong(String lat, String long) async {
    final apiKey = 'YOUR_MAP_KEY';
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$apiKey';
    print("api ====> $url");
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("response body ==> ${response.body}");
      if (data['status'] == 'OK') {
        print(data['results'][0]['formatted_address']);
        return PlaceInfo.fromJson(data['results'][0]);
      }
    }

    return null;
  }
}
