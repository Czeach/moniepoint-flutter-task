import 'package:flutter/material.dart';

typedef BottomNavItem = ({int index, IconData icon});

typedef ListingModel = ({String address, String image, int mainAxis, int crossAxis});

class Constants {
  static List<BottomNavItem> navItems = [
    (index: 0, icon: Icons.search_rounded),
    (index: 1, icon: Icons.message_rounded),
    (index: 2, icon: Icons.home_filled),
    (index: 3, icon: Icons.favorite_rounded),
    (index: 4, icon: Icons.person),
  ];

  static List<ListingModel> listings = [
    (address: 'Gladkova St., 25', image: 'assets/images/place_1.png', mainAxis: 2, crossAxis: 1),
    (address: 'Gubina St., 11', image: 'assets/images/place_2.png', mainAxis: 1, crossAxis: 2),
    (address: 'Trefoleva St., 43', image: 'assets/images/place_3.png', mainAxis: 1, crossAxis: 1),
    (address: 'Sedova St., 22', image: 'assets/images/place_4.png', mainAxis: 1, crossAxis: 1)
  ];
}