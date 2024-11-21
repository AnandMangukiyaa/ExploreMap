import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_assignment1/domain/location/place_info.dart';
import 'package:flutter_assignment1/presentation/marker/animatation_marker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_assignment1/application/application_life_cycle/application_life_cycle_cubit.dart';
import 'package:flutter_assignment1/application/permission/permission_cubit.dart';
import 'package:flutter_assignment1/domain/location/i_location_service.dart';
import 'package:flutter_assignment1/domain/location/location_model.dart';
import 'package:latlong2/latlong.dart';
import 'package:rxdart/rxdart.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  final ILocationService _locationService;
  final PermissionCubit _permissionCubit;
  final ApplicationLifeCycleCubit _applicationLifeCycleCubit;
  StreamSubscription<LocationModel>? _userPositionSubscription;
  StreamSubscription<List<PermissionState>>? _permissionStatePairSubscription;
  StreamSubscription<List<ApplicationLifeCycleState>>?
      _appLifeCycleStatePairSubscription;
  List<GlobalKey<AnimationMarkerState>> keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  List<GlobalKey<AnimationMarkerState>> keys1 = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  List<GlobalKey<AnimationMarkerState>> keys2 = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  List<GlobalKey<AnimationMarkerState>> selected = [];
  List<Marker> shoppingMarkers = [];
  List<Marker> cycleMarkers = [];
  List<Marker> restroMarkers = [];
  List<Marker> _newMarkers = [];
  void showMarkersOneByOne(List<Marker> marks, List<GlobalKey<AnimationMarkerState>> keys) async {
    if (_newMarkers.isEmpty) {
      for (int i = 0; i < marks.length; i++) {
        await Future.delayed(Duration(milliseconds: 500));
        _newMarkers.add(marks[i]);
        emit(state.copyWith(markers: List<Marker>.from(_newMarkers)));
      }
    } else {
      for (int i = 0; i < _newMarkers.length; i++) {
        await Future.delayed(Duration(milliseconds: 300));

        keys[i].currentState?.reverseAnimation();
      }
      await Future.delayed(Duration(milliseconds: 300));

      _newMarkers.clear();
      for (int i = 0; i < marks.length; i++) {
        await Future.delayed(Duration(milliseconds: 500));
        _newMarkers.add(marks[i]);
        emit(state.copyWith(markers: List<Marker>.from(_newMarkers)));
      }
    }
  }
  void updateSelected(List<GlobalKey<AnimationMarkerState>> keys){
    selected.clear();
    selected.addAll(keys);
  }

  void getPlaceInfoFromLatLang(LatLng location) async{
    PlaceInfo? placeInfo = await _locationService.getPlaceFromLatLong(location.latitude.toString(), location.longitude.toString());


    if(placeInfo != null){
      print("Place Infos : ${placeInfo?.placeName}");
      emit(state.copyWith(placeInfo: PlaceInfo.fromMap(placeInfo.toMap())));
    }
  }

  void addMarkers(){
    shoppingMarkers = [
      Marker(width: 50, height: 50, point: LatLng(37.42796133580664, -122.085749655962), child: AnimationMarker("assets/svgs/cart.svg", LatLng(37.42796133580664, -122.085749655962),key: keys[0])),
      Marker(width: 50, height: 50, point: LatLng(37.43296265331129, -122.08833357075216), child: AnimationMarker("assets/svgs/cart.svg", LatLng(37.43296265331129, -122.08833357075216),key: keys[1])),
      Marker(width: 50, height: 50, point: LatLng(37.430007358400614, -122.09279406716532), child: AnimationMarker("assets/svgs/cart.svg", LatLng(37.430007358400614, -122.09279406716532),key: keys[2])),
      Marker(width: 50, height: 50, point: LatLng(37.42101562316406, -122.08999255963044), child: AnimationMarker("assets/svgs/cart.svg", LatLng(37.42101562316406, -122.08999255963044),key: keys[3])),
      Marker(width: 50, height: 50, point: LatLng(37.42096559667973, -122.08279533660888), child: AnimationMarker("assets/svgs/cart.svg",LatLng(37.42096559667973, -122.08279533660888), key: keys[4])),
    ];
    cycleMarkers = [
      Marker(width: 50, height: 50, point: LatLng(37.428648, -122.086720), child: AnimationMarker("assets/svgs/cycle.svg", LatLng(37.428648, -122.086720),key: keys1[0])),
      Marker(width: 50, height: 50, point: LatLng(37.431594, -122.086623), child: AnimationMarker("assets/svgs/cycle.svg", LatLng(37.431594, -122.086623),key: keys1[1])),
      Marker(width: 50, height: 50, point: LatLng(37.426085, -122.086816), child: AnimationMarker("assets/svgs/cycle.svg", LatLng(37.426085, -122.086816),key: keys1[2])),
      Marker(width: 50, height: 50, point: LatLng(37.428553, -122.089297), child: AnimationMarker("assets/svgs/cycle.svg", LatLng(37.428553, -122.089297),key: keys1[3])),
      Marker(width: 50, height: 50, point: LatLng(37.427845, -122.081855), child: AnimationMarker("assets/svgs/cycle.svg", LatLng(37.427845, -122.081855),key: keys1[4])),
    ];
    restroMarkers = [
      Marker(width: 50, height: 50, point: LatLng(37.42400833753989, -122.08810280177167), child: AnimationMarker("assets/svgs/rastaurant.svg", LatLng(37.42400833753989, -122.08810280177167),key: keys2[0])),
      Marker(width: 50, height: 50, point: LatLng(37.42840990932159, -122.09408761645678), child: AnimationMarker("assets/svgs/rastaurant.svg", LatLng(37.42840990932159, -122.09408761645678), key: keys2[1])),
      Marker(width: 50, height: 50, point: LatLng(37.427286128360564, -122.08070285849107), child: AnimationMarker("assets/svgs/rastaurant.svg", LatLng(37.427286128360564, -122.08070285849107), key: keys2[2])),
      Marker(width: 50, height: 50, point: LatLng(37.4324600632365, -122.08656974579321), child: AnimationMarker("assets/svgs/rastaurant.svg", LatLng(37.4324600632365, -122.08656974579321), key: keys2[3])),
      Marker(width: 50, height: 50, point: LatLng(37.43054036442099, -122.07695866408214), child: AnimationMarker("assets/svgs/rastaurant.svg", LatLng(37.43054036442099, -122.07695866408214), key: keys2[4])),
    ];
    selected.addAll(keys2);
    Future.delayed(Duration(seconds: 2), () => showMarkersOneByOne(restroMarkers, []));
  }
  LocationCubit(this._locationService, this._permissionCubit,
      this._applicationLifeCycleCubit)
      : super(LocationState.initial()) {
    if (_permissionCubit.state.isLocationPermissionGrantedAndServicesEnabled) {
      _userPositionSubscription =
          _locationService.positionStream.listen(_userPositionListener);
    }




    _permissionStatePairSubscription = _permissionCubit.stream
        .startWith(_permissionCubit.state)
        .pairwise()
        .listen((pair) async {
      final previous = pair.first;
      final current = pair.last;
      if (previous.isLocationPermissionGrantedAndServicesEnabled !=
              current.isLocationPermissionGrantedAndServicesEnabled &&
          current.isLocationPermissionGrantedAndServicesEnabled) {
        await _userPositionSubscription?.cancel();
        _userPositionSubscription =
            _locationService.positionStream.listen(_userPositionListener);
      } else if (previous.isLocationPermissionGrantedAndServicesEnabled !=
              current.isLocationPermissionGrantedAndServicesEnabled &&
          !current.isLocationPermissionGrantedAndServicesEnabled) {
        _userPositionSubscription?.cancel();
      }
    });

    _appLifeCycleStatePairSubscription = _applicationLifeCycleCubit.stream
        .startWith(_applicationLifeCycleCubit.state)
        .pairwise()
        .listen((pair) async {
      final previous = pair.first;
      final current = pair.last;
      final isLocationPermissionGrantedAndServicesEnabled =
          _permissionCubit.state.isLocationPermissionGrantedAndServicesEnabled;
      if (previous.isResumed != current.isResumed &&
          current.isResumed &&
          isLocationPermissionGrantedAndServicesEnabled) {
        await _userPositionSubscription?.cancel();
        _userPositionSubscription =
            _locationService.positionStream.listen(_userPositionListener);
      } else if (previous.isResumed != current.isResumed &&
          !current.isResumed) {
        await _userPositionSubscription?.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _userPositionSubscription?.cancel();
    _permissionStatePairSubscription?.cancel();
    _appLifeCycleStatePairSubscription?.cancel();

    return super.close();
  }

  void _userPositionListener(LocationModel location) {
    emit(state.copyWith(userLocation: location,markers: []));
  }
}
