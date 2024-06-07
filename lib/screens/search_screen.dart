import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_task/theme/colors.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState()  => _SearchScreenState(); 
}

class _SearchScreenState extends State<SearchScreen> {
  bool _animateItems = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          SafeArea(
            child: AnimatedScale(
              scale: _animateItems ? 1 : 0, 
              duration: const Duration(milliseconds: 500),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: colorScheme.onPrimary,
                    ),
                  hintText: 'Saint Petersburg'
                ),
              ),
              )
            )
        ],
      ),
    );
  }
  
}