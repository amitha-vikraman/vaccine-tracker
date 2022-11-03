import 'package:flutter/material.dart';
import 'package:vaccine_tracker/student_add_page.dart';
import 'package:vaccine_tracker/student_detail.dart';
import 'package:vaccine_tracker/vaccination_add.dart';

class NavBarDesktop extends StatelessWidget {
  const NavBarDesktop({Key? key}) : super(key: key);

  Widget getNavForStudents(String text, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, left: 20),
      child: TextButton(
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
      ),
    );
  }

  Widget getNavForVaccination(String text, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, left: 20),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VaccinationAddPage()),
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
      ),
    );
  }

  Widget getNavForReports(String text, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, left: 20),
      child: TextButton(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: getNavForStudents('Students', context),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 1,
            child: getNavForVaccination('Vaccinations', context),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 1,
            child: getNavForReports('Student Reports', context),
          ),
        ],
      ),
    );
  }
}
