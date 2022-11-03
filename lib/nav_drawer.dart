import 'package:flutter/material.dart';
import 'package:vaccine_tracker/nav_bar_drawer_report.dart';
import 'package:vaccine_tracker/nav_bar_drawer_vaccination.dart';
import 'package:vaccine_tracker/nav_drawer_student.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavDrawerItemStudent(),
          NavDrawerItemReport(),
          NavDrawerItemVaccinations(),
        ],
      ),
    );
  }
}
