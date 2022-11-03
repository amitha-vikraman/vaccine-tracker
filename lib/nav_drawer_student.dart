import 'package:flutter/material.dart';
import 'package:vaccine_tracker/student_add_page.dart';

class NavDrawerItemStudent extends StatelessWidget {
  const NavDrawerItemStudent();

  Widget getNavForStudents(String text, BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentAddPage()),
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
      child: getNavForStudents('Students', context),
    );
  }
}
