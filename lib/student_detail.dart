import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final _firestore = FirebaseFirestore.instance;
  List studentList = [];
  List docIds = [];

  Future getDocIds() async {
    await _firestore
        .collection('student')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIds.add(document.reference.id);
            }));
  }

  FutureBuilder getStudentName(String docId) {
    CollectionReference studentCollection = _firestore.collection('student');
    return FutureBuilder<DocumentSnapshot>(
        future: studentCollection.doc(docId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> student =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${student['name']}');
          }
          return Text('Loading');
        });
  }

  FutureBuilder getStudentAddress(String docId) {
    CollectionReference studentCollection = _firestore.collection('student');
    return FutureBuilder<DocumentSnapshot>(
        future: studentCollection.doc(docId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> student =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${student['address']}');
          }
          return Text('Loading');
        });
  }

  FutureBuilder getStudentVaccineDetails(String docId) {
    CollectionReference studentCollection = _firestore.collection('student');
    return FutureBuilder<DocumentSnapshot>(
        future: studentCollection.doc(docId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> student =
                snapshot.data!.data() as Map<String, dynamic>;
            return student['vaccinationStatus'] != 'No'
                ? Text(
                    ' Vaccinated with ${student['vaccine name']} on ${student['date of vaccine']}')
                : Text('Not yet Vaccinated');
          }
          return Text('Loading');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            margin: EdgeInsets.only(
              top: 40,
              left: 20,
            ),
            alignment: Alignment.center,
            child: Text(
              'Student Details ',
              style: TextStyle(
                fontFamily: 'SourceSans',
                fontSize: 40,
                color: Colors.teal.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getDocIds(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docIds.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        minLeadingWidth: 50,
                        leading: getStudentName(docIds[index]),
                        title: getStudentAddress(docIds[index]),
                        subtitle: getStudentVaccineDetails(docIds[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
