import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_task/theme/colors.dart';

class AnimatedMarker extends StatefulWidget {
  const AnimatedMarker({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _AnimatedMarkerState();
}

class _AnimatedMarkerState extends State<AnimatedMarker> {
  bool _animateMarkers = false;

  @override
  void initState() {
    super.initState();
    _animateMarkers = true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _animateMarkers ? 1 : 0,
      duration: const Duration(milliseconds: 3000),
      alignment: Alignment.bottomLeft,
      child: Container(
        decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 44),
          ),
        ),
      ),
    );
  }
}
