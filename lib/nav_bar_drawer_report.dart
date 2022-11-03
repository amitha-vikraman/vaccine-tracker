import 'package:flutter/material.dart';
import 'package:vaccine_tracker/student_detail.dart';

class NavDrawerItemReport extends StatelessWidget {
  const NavDrawerItemReport();

  Widget getNavForReports(String text, BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StudentsPage()),
        );
      },
      child: Text(
        '$text',
        style: TextStyle(
          fontFamily: 'SourceSans',
          fontSize: 25,
          color: Colors.teal.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60),
      child: getNavForReports('Student Reports', context),
    );
  }
}
