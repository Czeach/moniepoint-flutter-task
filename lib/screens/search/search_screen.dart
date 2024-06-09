import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moniepoint_flutter_task/screens/search/widgets/animated_marker.dart';
import 'package:moniepoint_flutter_task/theme/colors.dart';
import 'package:moniepoint_flutter_task/util/constants.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _mapController = Completer<GoogleMapController>();
  String _mapStyle = '';
  bool _animateItems = false;
  bool _animateOptions = false;

  Future<void> _loadMapStyle() async {
    final String style =
        await rootBundle.loadString('assets/files/map_style.json');
    setState(() {
      _mapStyle = style;
    });
  }

  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(6.6025926099405226, 3.2849539756822987),
    zoom: 16,
  );

  final Set<Marker> _markers = {};

  Future<void> _addMarkers() async {
    await Future.delayed(const Duration(milliseconds: 600));
    _markers.addAll({
      Marker(
        markerId: const MarkerId('marker_1'),
        position: const LatLng(6.607354, 3.282811),
        icon: await const CustomMarker(title: '10,3 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_2'),
        position: const LatLng(6.605701, 3.283308),
        icon: await const CustomMarker(title: '11 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_3'),
        position: const LatLng(6.604992, 3.287754),
        icon: await const CustomMarker(title: '7,8 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_4'),
        position: const LatLng(6.602455, 3.287775),
        icon: await const CustomMarker(title: '8,5 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_5'),
        position: const LatLng(6.600324, 3.283097),
        icon: await const CustomMarker(title: '13,3 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_6'),
        position: const LatLng(6.597686, 3.286839),
        icon: await const CustomMarker(title: '6,95 mn P').toBitmapDescriptor(),
      )
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            style: _mapStyle,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) async {
              _mapController.complete(controller);
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                await Future.delayed(const Duration(milliseconds: 1000));
                if (mounted) {
                  setState(() {
                    _animateItems = true;
                  });
                }
              });
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                await _addMarkers();
                if (mounted) {
                  setState(() {});
                }
              });
            },
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AnimatedScale(
                        scale: _animateItems ? 1 : 0,
                        duration: const Duration(milliseconds: 700),
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(40)),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                hintText: 'Saint Petersburg',
                                hintStyle:
                                    TextStyle(color: colorScheme.surface),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: colorScheme.surface,
                                )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    AnimatedScale(
                      scale: _animateItems ? 1 : 0,
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        decoration: BoxDecoration(
                            color: colorScheme.onPrimary,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            Icons.swap_horiz_rounded,
                            color: colorScheme.surface,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Stack(
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: AnimatedScale(
                        scale: _animateItems ? 1 : 0,
                        duration: const Duration(milliseconds: 700),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _animateOptions = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    colorScheme.secondaryFixed.withOpacity(0.9),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Icon(Icons.layers,
                                  color: colorScheme.onPrimary),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _animateOptions = false;
                        });
                      },
                      child: AnimatedScale(
                        alignment: Alignment.bottomLeft,
                        scale: _animateOptions ? 1 : 0,
                        duration: const Duration(milliseconds: 700),
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(24)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: Constants.menuItems.map((item) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        item.icon,
                                        color: item.index == 1
                                            ? colorScheme.primary
                                            : colorScheme.secondaryFixed,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        item.title,
                                        style: TextStyle(
                                            color: item.index == 1
                                                ? colorScheme.primary
                                                : colorScheme.secondaryFixed),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 4),
                        AnimatedScale(
                          scale: _animateItems ? 1 : 0,
                          duration: const Duration(milliseconds: 700),
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    colorScheme.secondaryFixed.withOpacity(0.9),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Icon(Icons.arrow_outward,
                                  color: colorScheme.onPrimary),
                            ),
                          ),
                        )
                      ],
                    ),
                    AnimatedScale(
                      scale: _animateItems ? 1 : 0,
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        decoration: BoxDecoration(
                            color: colorScheme.secondaryFixed.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(28)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 12, left: 18, right: 18),
                          child: Row(
                            children: [
                              Icon(Icons.menu, color: colorScheme.onPrimary),
                              const SizedBox(width: 10),
                              Text(
                                'List of variants',
                                style: TextStyle(color: colorScheme.onPrimary),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: kBottomNavigationBarHeight * 1.4),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
