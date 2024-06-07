import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moniepoint_flutter_task/screens/home/widgets/listing_item.dart';
import 'package:moniepoint_flutter_task/theme/colors.dart';
import 'package:moniepoint_flutter_task/util/constants.dart';

class Listings extends StatefulWidget {
  const Listings({
    super.key,
  });

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  bool _animateListings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 3500));
      if (mounted) {
        setState(() {
          _animateListings = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
        offset: _animateListings ? Offset.zero : const Offset(0, 1),
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            color: colorScheme.onPrimary,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: Constants.listings
                        .map(
                          (listing) => StaggeredGridTile.count(
                            crossAxisCellCount: listing.mainAxis,
                            mainAxisCellCount: listing.crossAxis,
                            child: ListingItem(
                              image: listing.image,
                              address: listing.address,
                              alignment: listing.mainAxis > listing.crossAxis
                                  ? Alignment.center
                                  : Alignment.centerLeft,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
