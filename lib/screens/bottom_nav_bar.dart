import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_task/theme/colors.dart';
import 'package:moniepoint_flutter_task/util/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {super.key,
      required this.currentScreen,
      required this.controller,
      required this.onScreenChanged});

  final int currentScreen;
  final PageController controller;
  final void Function(int index) onScreenChanged;

  @override
  State<StatefulWidget> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  bool _navBarAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _navBarAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
        offset: _navBarAnimation ? Offset.zero : const Offset(0, 1),
        duration: const Duration(milliseconds: 300),
        child: SafeArea(
          child: Material(
            shape: const StadiumBorder(),
            color: colorScheme.shadow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: Constants.navItems.map((item) {
                final selected = item.index == widget.currentScreen;
                return GestureDetector(
                  onTap: () {
                    widget.onScreenChanged.call(item.index);
                    widget.controller.jumpToPage(item.index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundColor:
                          selected ? colorScheme.primary : colorScheme.surface,
                      radius: selected ? 24 : 20,
                      child: Icon(
                        item.icon,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}
