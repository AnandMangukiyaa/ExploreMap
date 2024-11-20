import 'package:flutter/material.dart';
import 'package:flutter_assignment1/animatation_marker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_assignment1/application/location/location_cubit.dart';
import 'package:flutter_assignment1/application/permission/permission_cubit.dart';

import '../../injection.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  AnimatedMapController? mapController;
  LocationCubit _locationCubit = GetIt.I<LocationCubit>();
  PermissionCubit _permissionCubit = GetIt.I<PermissionCubit>();

  @override
  void initState() {
    mapController = AnimatedMapController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PermissionCubit, PermissionState>(
          bloc: _permissionCubit,
          listenWhen: (p, c) {
            return p.isLocationPermissionGrantedAndServicesEnabled !=
                    c.isLocationPermissionGrantedAndServicesEnabled &&
                c.isLocationPermissionGrantedAndServicesEnabled;
          },
          listener: (context, state) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
        BlocListener<PermissionCubit, PermissionState>(
          bloc: _permissionCubit,
          listenWhen: (p, c) =>
              p.displayOpenAppSettingsDialog !=
                  c.displayOpenAppSettingsDialog &&
              c.displayOpenAppSettingsDialog,
          listener: (context, state) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  content: AppSettingsDialog(
                    openAppSettings: () {
                      debugPrint("Open App Settings pressed!");
                      context.read<PermissionCubit>().openAppSettings();
                    },
                    cancelDialog: () {
                      debugPrint("Cancel pressed!");
                      context
                          .read<PermissionCubit>()
                          .hideOpenAppSettingsDialog();
                    },
                  ),
                );
              },
            );
          },
        ),
        BlocListener<PermissionCubit, PermissionState>(
          bloc: _permissionCubit,
            listenWhen: (p, c) =>
                p.displayOpenAppSettingsDialog !=
                    c.displayOpenAppSettingsDialog &&
                !c.displayOpenAppSettingsDialog,
            listener: (context, state) {
              Navigator.of(context).pop();
            }),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Explore Map"),
        ),
        floatingActionButton:  BlocBuilder<LocationCubit, LocationState>(
    buildWhen: (p, c) {
    return p.isUserLocationReady != c.isUserLocationReady;
    },
    builder: (context, state) {
    return !state.isUserLocationReady
    ? const SizedBox.shrink()
        : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: () {

                  _locationCubit.showMarkersOneByOne(_locationCubit.cycleMarkers, List.from(_locationCubit.selected));
                  _locationCubit.updateSelected(_locationCubit.keys1);
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.pedal_bike,
                      color: Colors.white,
                    ),
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
                onTap: () {
                  _locationCubit.showMarkersOneByOne(_locationCubit.restroMarkers, List.from(_locationCubit.selected));
                  _locationCubit.updateSelected(_locationCubit.keys2);
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.restaurant,
                      color: Colors.white,
                    ),
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                _locationCubit.showMarkersOneByOne(_locationCubit.shoppingMarkers, List.from(_locationCubit.selected));
                _locationCubit.updateSelected(_locationCubit.keys);
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );}),
        body: Stack(
          children: [
            Center(
              child: BlocBuilder<LocationCubit, LocationState>(
                bloc: _locationCubit,
                buildWhen: (p, c) {
                  if(p.userLocation != c.userLocation){
                    _locationCubit.addMarkers();
                  }
                  return true;//p.userLocation != c.userLocation || p.markers.isNotEmpty;
                },
                builder: (context, locationState) {
                  return FlutterMap(
                    mapController: mapController!.mapController,
                    options: MapOptions(
                      initialCenter: LatLng(37.42796133580664, -122.085749655962),
                      initialZoom: 14.85,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            //'https://stamen-tiles.a.ssl.fastly.net/watercolor/{z}/{x}/{y}.png',
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.flutter_assignment1',
                      ),
                      MarkerLayer(
                        markers: [
                          if (locationState.isUserLocationReady)
                            Marker(
                              point: LatLng(
                                  locationState.userLocation.latitude,
                                  locationState.userLocation.longitude),
                              width: 50,
                              height: 65,
                              child: const UserMarker(),
                            ),
                          ...locationState.markers
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            BlocSelector<PermissionCubit, PermissionState, bool>(
              selector: (state) {
                return state.isLocationPermissionGrantedAndServicesEnabled;
              },
              builder:
                  (context, isLocationPermissionGrantedAndServicesEnabled) {
                return isLocationPermissionGrantedAndServicesEnabled
                    ? const SizedBox.shrink()
                    : const Positioned(
                        right: 30,
                        bottom: 50,
                        child: LocationButton(),
                      );
              },
            ),
            BlocBuilder<LocationCubit, LocationState>(
              buildWhen: (p, c) {
                return p.isUserLocationReady != c.isUserLocationReady;
              },
              builder: (context, state) {
                return !state.isUserLocationReady
                    ? const SizedBox.shrink()
                    : Positioned(
                        left: 30,
                        bottom: 50,
                        child: CenterButton(
                          onPressed: () {
                            mapController!.animateTo(dest:  LatLng(state.userLocation.latitude,
                                state.userLocation.longitude),zoom:
                              mapController!.mapController.camera.zoom,);
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserMarker extends StatefulWidget {
  const UserMarker({super.key});

  @override
  State<UserMarker> createState() => _UserMarkerState();
}

class _UserMarkerState extends State<UserMarker>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    sizeAnimation = Tween<double>(
      begin: 1,
      end: 50,
    ).animate(CurvedAnimation(

        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.repeat(
      reverse: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 50,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 30,
              width: 40,
              child: AnimatedBuilder(
                animation: sizeAnimation,
                builder: (context, child) {
                  return Center(
                    child: Container(
                      width: sizeAnimation.value,
                      height: sizeAnimation.value/2,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 1),
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      padding: EdgeInsets.all(2),
                      child: Container(decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),),
                    ),
                  );
                },
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/svgs/user.svg",height: 50,width: 50,),
              const SizedBox(height: 15,)
            ],
          )
        ],
      ),
    );
  }
}

class CenterButton extends StatelessWidget {
  final Function onPressed;
  const CenterButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return Colors.black;
          },
        ),
      ),
      onPressed: () {
        debugPrint("Center button Pressed!");

        onPressed();
      },
      child: const Text("Center",style: TextStyle(color: Colors.white),),
    );
  }
}

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return Colors.black;
          },
        ),
      ),
      onPressed: () {
        debugPrint("Location Services button Pressed!");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            final bool isLocationPermissionGranted = context.select(
                (PermissionCubit element) =>
                    element.state.isLocationPermissionGranted);
            final bool isLocationServicesEnabled = context.select(
                (PermissionCubit element) =>
                    element.state.isLocationServicesEnabled);
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              content: PermissionDialog(
                isLocationPermissionGranted: isLocationPermissionGranted,
                isLocationServicesEnabled: isLocationServicesEnabled,
              ),
            );
          },
        );
      },
      child: const Text("Request Location Permission",style: TextStyle(color: Colors.white),),
    );
  }
}

class PermissionDialog extends StatelessWidget {
  final bool isLocationPermissionGranted;
  final bool isLocationServicesEnabled;
  const PermissionDialog({
    super.key,
    required this.isLocationPermissionGranted,
    required this.isLocationServicesEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        const Text(
            "Please allow location permission and services to view your location:)"),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Location Permission: "),
            TextButton(
              onPressed: isLocationPermissionGranted
                  ? null
                  : () {
                      debugPrint("Location permission button pressed!");
                      context
                          .read<PermissionCubit>()
                          .requestLocationPermission();
                    },
              child: Text(isLocationPermissionGranted ? "allowed" : "allow"),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Location Services: "),
            TextButton(
              onPressed: isLocationServicesEnabled
                  ? null
                  : () {
                      debugPrint("Location services button pressed!");
                      context.read<PermissionCubit>().openLocationSettings();
                    },
              child: Text(isLocationServicesEnabled ? "allowed" : "allow"),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class AppSettingsDialog extends StatelessWidget {
  final Function openAppSettings;
  final Function cancelDialog;
  const AppSettingsDialog({
    super.key,
    required this.openAppSettings,
    required this.cancelDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        const Text(
            "You need to open app settings to grant Location Permission"),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                openAppSettings();
              },
              child: const Text("Open App Settings"),
            ),
            TextButton(
              onPressed: () {
                cancelDialog();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
