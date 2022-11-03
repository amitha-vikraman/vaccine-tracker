import 'package:flutter/material.dart';
import 'package:vaccine_tracker/nav_drawer.dart';

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 80,
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavigationDrawer()),
            );
          },
        ),
      ),
    );
  }
}
