import 'package:flutter/material.dart';
import 'package:vaccine_tracker/vaccination_add.dart';

class NavDrawerItemVaccinations extends StatelessWidget {
  const NavDrawerItemVaccinations();

  Widget getNavForVaccination(String text, BuildContext context) {
    return TextButton(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60),
      child: getNavForVaccination('Vaccinations', context),
    );
  }
}
