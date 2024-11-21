import 'package:flutter/material.dart';
import 'package:flutter_assignment1/application/location/location_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';

class AnimationMarker extends StatefulWidget {
  final String child;
  final LatLng location;
  const AnimationMarker(this.child,this.location,{super.key});

  @override
  State<AnimationMarker> createState() => AnimationMarkerState();
}

class AnimationMarkerState extends State<AnimationMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> sizeAnimation;
  LocationCubit _locationCubit = GetIt.I<LocationCubit>();

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      reverseDuration: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: 500),
    )..forward();
    sizeAnimation =CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  reverseAnimation(){
    animationController.reverse();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: ConstrainedBox(
      constraints: BoxConstraints(
      maxHeight: 50,
      maxWidth: 50,
    ),
    child: AnimatedBuilder(
      animation: sizeAnimation,
      builder: (context, child) {
        return GestureDetector(
          onTap: (){
            _locationCubit.getPlaceInfoFromLatLang(widget.location);
          },
            child: SvgPicture.asset(widget.child,height: 50 * sizeAnimation.value,width: 50 *sizeAnimation.value,));
      },
    )));
  }
}