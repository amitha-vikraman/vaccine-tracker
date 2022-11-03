import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_page.dart';

class StudentAddPage extends StatefulWidget {
  StudentAddPage({Key? key}) : super(key: key);

  @override
  State<StudentAddPage> createState() => _StudentAddPageState();
}

class _StudentAddPageState extends State<StudentAddPage> {
  final _firestore = FirebaseFirestore.instance;
  final formkey = GlobalKey<FormState>();
  String studentName = '';
  String address = '';
  String vaccinationStatus = '';
  String vaccineName = '';
  String dateOfVaccine = '';
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
                  'Add Student',
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
                  labelText: 'Name',
                  focusColor: Colors.red,
                ),
                textAlign: TextAlign.start,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value != null && value.length < 3) {
                    return 'Please enter a name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) => setState(() => studentName = value!),
              ),
              SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  focusColor: Colors.red,
                ),
                textAlign: TextAlign.start,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value != null && value.length < 3) {
                    return 'Please enter a name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) => setState(() => address = value!),
              ),
              SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Vaccine Status',
                  focusColor: Colors.red,
                ),
                textAlign: TextAlign.start,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                onSaved: (value) => setState(() => vaccinationStatus = value!),
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
                  labelText: 'Date of Vaccination',
                  focusColor: Colors.red,
                ),
                textAlign: TextAlign.start,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                onSaved: (value) => setState(() => dateOfVaccine = value!),
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
                      _firestore.collection('student').add({
                        'name': studentName,
                        'address': address,
                        'vaccinationStatus': vaccinationStatus,
                        'vaccine name': vaccineName,
                        'date of vaccine': dateOfVaccine,
                      });
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('Submit'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal.shade300),
                    minimumSize: MaterialStateProperty.all(
                      Size.fromHeight(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
