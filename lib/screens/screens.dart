import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_task/screens/bottom_nav_bar.dart';
import 'package:moniepoint_flutter_task/screens/home/home_screen.dart';
import 'package:moniepoint_flutter_task/screens/search_screen.dart';
import 'package:moniepoint_flutter_task/util/constants.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  late PageController _controller;
  int _screenIndex = 2;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _screenIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: Constants.navItems.map<Widget>((item) {
              if (item.index == 2) {
                return const HomeScreen();
              } else if (item.index == 0) {
                return SearchScreen();
              } else {
                return Center(child: Icon(item.icon));
              }
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: BottomNavBar(
                currentScreen: _screenIndex,
                controller: _controller,
                onScreenChanged: (index) {
                  setState(() {
                    _screenIndex = index;
                  });
                }),
          )
        ],
      ),
    );
  }
}
