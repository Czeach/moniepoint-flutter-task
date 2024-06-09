import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_task/theme/colors.dart';

class CustomMarker extends StatefulWidget {
  const CustomMarker({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
