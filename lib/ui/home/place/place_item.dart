import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tourist_guide/model/place.dart';

class PlaceItem extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Container(
            height: 240,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              imageUrl: place.photoUrl,
              placeholder: (context, url) => Center(
                child: SizedBox(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              color: Colors.black45,
              child: Text(
                place.name,
                style: TextStyle(color: Colors.white),
              ),
            ))
      ]),
    );
  }

  final Place place;
  PlaceItem({this.place});
}
