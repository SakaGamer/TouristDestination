
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tourist_guide/model/place.dart';
import 'package:tourist_guide/ui/home/place/place_item.dart';

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  List<Place> list = List();
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _getPlace();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading == false
          ? ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext buildContext, index) =>
                  PlaceItem(place: list[index]))
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  _getPlace() async {
    setState(() {
      _isLoading = true;
    });
    await Firestore.instance.collection('places').getDocuments().then((datas) {
      print(datas.documents.length);
      for (var data in datas.documents) {
        Place place = Place.from(data);
        list.add(place);
      }
    }).catchError((onError) {
      print(onError);
    });
    setState(() {
      _isLoading = false;
    });
  }
}
