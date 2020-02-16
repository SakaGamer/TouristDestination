import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tourist_guide/model/province.dart';
import 'package:tourist_guide/ui/home/provice/province_item.dart';

class ProvicePage extends StatefulWidget {
  @override
  _ProviceState createState() => _ProviceState();
}

class _ProviceState extends State<ProvicePage> {

  List<Province> list = List();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getProvince();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading == false
          ? ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext buildContext, index) =>
                  ProvinceItem(province: list[index]))
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  _getProvince() async {
    setState(() {
      _isLoading = true;
    });

    await Firestore.instance
        .collection("provinces")
        .getDocuments()
        .then((datas) {
      print(datas.documents.length);
      for (var data in datas.documents) {
        Province province = Province.from(data);
        list.add(province);
      }
    }).catchError((onError) {
      print(onError);
    });

    setState(() {
      _isLoading = false;
    });
  }


}
