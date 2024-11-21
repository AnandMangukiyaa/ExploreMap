import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationMarker extends StatefulWidget {
  final String child;
  const AnimationMarker(this.child,{super.key});

  @override
  State<AnimationMarker> createState() => AnimationMarkerState();
}

class AnimationMarkerState extends State<AnimationMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> sizeAnimation;

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
        return SvgPicture.asset(widget.child,height: 50 * sizeAnimation.value,width: 50 *sizeAnimation.value,);
      },
    )));
  }
}