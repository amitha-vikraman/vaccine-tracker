import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_page.dart';

class VaccinationAddPage extends StatefulWidget {
  const VaccinationAddPage({Key? key}) : super(key: key);

  @override
  State<VaccinationAddPage> createState() => _VaccinationAddPageState();
}

class _VaccinationAddPageState extends State<VaccinationAddPage> {
  final _firestore = FirebaseFirestore.instance;
  final formkey = GlobalKey<FormState>();
  String centre = '';
  String date = '';
  String vaccineName = '';
  String slotsAvailable = '';
  var padding;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      padding = sizingInformation.isMobile
          ? EdgeInsets.only(left: 20, right: 20, top: 20)
          : EdgeInsets.only(left: 400, right: 400, top: 50);
      return MaterialApp(
        home: Scaffold(
          body: Form(
            key: formkey,
            child: ListView(
              padding: padding,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 32),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Book Vaccination Drive',
                    style: TextStyle(
                      fontFamily: 'SourceSans',
                      fontSize: 40,
                      color: Colors.teal.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Centre',
                    focusColor: Colors.red,
                  ),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value != null && value.length < 3) {
                      return 'Please enter a centre';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => setState(() => centre = value!),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date of Booking',
                    focusColor: Colors.red,
                  ),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value != null && value.length < 3) {
                      return 'Please enter a location';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => setState(() => date = value!),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Vaccine Name',
                    focusColor: Colors.red,
                  ),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  onSaved: (value) => setState(() => vaccineName = value!),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'No. of slots available',
                    focusColor: Colors.red,
                  ),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  onSaved: (value) => setState(() => slotsAvailable = value!),
                ),
                SizedBox(
                  height: 32,
                ),
                Material(
                  child: ElevatedButton(
                    onPressed: () {
                      final isValid = formkey.currentState!.validate();
                      if (isValid) {
                        formkey.currentState!.save();
                        _firestore.collection('vaccinations').add({
                          'centre': centre,
                          'date': date,
                          'vaccineName': vaccineName,
                          'no of vaccines': slotsAvailable,
                        });
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text('Submit'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.teal.shade300),
                      minimumSize: MaterialStateProperty.all(
                        Size.fromHeight(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
