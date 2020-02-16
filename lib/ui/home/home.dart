import 'package:flutter/material.dart';
import 'package:tourist_guide/ui/home/appbar.dart';
import 'package:tourist_guide/ui/home/extension/bottom_nav.dart';
import 'package:tourist_guide/ui/home/nearby/nearby.dart';
import 'package:tourist_guide/ui/home/place/place.dart';
import 'package:tourist_guide/ui/home/provice/provice.dart';
import 'package:tourist_guide/ui/home/recommend/recommend.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pages = [PlacePage(), NearbyPage(), ProvicePage(), RecommenedPage()];

  var title = ["Place", "Near by", "Province", "Recommend"];

  var currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appbar(title[currIndex]),
        bottomNavigationBar: bottomNavigation(currIndex, _onTap),
        body: IndexedStack(
          index: currIndex,
          children: pages,
        ),
      ),
    );
  }

  _onTap(int index) {
    setState(() {
      currIndex = index;
    });
  }
}
