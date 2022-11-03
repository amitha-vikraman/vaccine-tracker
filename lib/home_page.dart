import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vaccine_tracker/home_view_desktop.dart';
import 'package:vaccine_tracker/home_view_mobile.dart';
import 'package:vaccine_tracker/nav_bar_desktop.dart';
import 'package:vaccine_tracker/nav_bar_mobile.dart';
import 'package:vaccine_tracker/nav_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.isMobile ? NavigationDrawer() : null,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ScreenTypeLayout(
                desktop: NavBarDesktop(),
                mobile: NavBarMobile(),
              ),
              Expanded(
                child: ScreenTypeLayout(
                  desktop: HomeViewDesktop(),
                  mobile: HomeViewMobile(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
