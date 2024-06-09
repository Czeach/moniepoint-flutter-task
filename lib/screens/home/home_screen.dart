import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_task/screens/home/widgets/home_body.dart';
import 'package:moniepoint_flutter_task/screens/home/widgets/listings.dart';
import 'package:moniepoint_flutter_task/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [colorScheme.onPrimary, colorScheme.scrim],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.2, 0.9])),
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext headerContext, bool boolean) {
            return [
              const SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 420,
                flexibleSpace: FlexibleSpaceBar(
                  background: HomeBody(),
                ),
              )
            ];
          },
          body: const Listings()),
    );
  }
}
