import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_info.freezed.dart';

@freezed
abstract class PlaceInfo with _$PlaceInfo {
  const factory PlaceInfo({
    /// Address of the location
    required String address,

    /// City name
    required String city,

    /// State or province name
    required String state,

    /// Country name
    required String country,

    /// Postal code (zip code)
    required String postalCode,

    /// Full formatted address
    required String placeName,
  }) = _PlaceInfo;

  factory PlaceInfo.empty() =>
      const PlaceInfo(address: "", city: "", state: "",country: "",postalCode: "",placeName: "");

  factory PlaceInfo.fromJson(Map<String,dynamic> json) {
    return PlaceInfo(
      address: json['address_components'][0]['long_name'],
      city: json['address_components'][1]['long_name'],
      state: json['address_components'][2]['long_name'],
      country: json['address_components'][3]['long_name'],
      postalCode: json['address_components'][4]['long_name'],
      placeName: json['formatted_address'],
    );
  }

  factory PlaceInfo.fromMap(Map<String,dynamic> json) {
    return PlaceInfo(
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalCode: json['postalCode'],
      placeName: json['placeName'],
    );
  }

 Map<String,dynamic> toMap(){
    return {
      "address":address,
      "city":city,
      "state":state,
      "country":country,
      "postalCode":postalCode,
      "placeName":placeName
    };
 }

}