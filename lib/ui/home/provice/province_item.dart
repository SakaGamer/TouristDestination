import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tourist_guide/model/province.dart';

class ProvinceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Container(
            height: 240,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              imageUrl: province.photoUrl,
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
                province.name,
                style: TextStyle(color: Colors.white),
              ),
            ))
      ]),
    );
  }

  final Province province;
  ProvinceItem({this.province});
}
