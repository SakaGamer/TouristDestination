import 'package:flutter/material.dart';

Widget bottomNavigation(int id, var callback) => BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Place")),
        BottomNavigationBarItem(icon: Icon(Icons.near_me), title: Text("Nearby")),
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("Provice")),
        BottomNavigationBarItem(icon: Icon(Icons.markunread_mailbox), title: Text("Suggest"))
      ],
      currentIndex: id,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      showUnselectedLabels: true,
      onTap: callback,
    );
