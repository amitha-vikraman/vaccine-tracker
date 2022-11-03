import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeViewMobile extends StatelessWidget {
  HomeViewMobile({Key? key}) : super(key: key);

  final _firestore = FirebaseFirestore.instance;
  List docIds = [];

  Future getDocIds() async {
    await _firestore
        .collection('vaccinations')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIds.add(document.reference.id);
            }));
    print(docIds.length);
  }

  FutureBuilder getVaccineCentre(String docId) {
    CollectionReference vaccinationCollection =
        _firestore.collection('vaccinations');
    return FutureBuilder<DocumentSnapshot>(
        future: vaccinationCollection.doc(docId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> vaccination =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
              'Booked  ${vaccination['vaccineName']} for  ${vaccination['no of vaccines']} slots at ${vaccination['centre']} on ${vaccination['date']} ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            );
          }
          return Text('Loading');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            'Booked Vaccinations ',
            style: TextStyle(
              fontFamily: 'SourceSans',
              fontSize: 22,
              color: Colors.teal.shade300,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: getDocIds(),
            builder: (context, snapshot) {
              return ListView.builder(
                //padding: EdgeInsets.only(top: 10.0, left: 50, right: 50),
                itemCount: docIds.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: getVaccineCentre(docIds[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 10, top: 15),
                child: Text(
                  'Data ',
                  style: TextStyle(
                    fontFamily: 'SourceSans',
                    fontSize: 22,
                    color: Colors.teal.shade300,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 40, top: 15),
                child: Text(
                  'No Upcoming Vaccination Drives ',
                  style: TextStyle(
                    fontFamily: 'SourceSans',
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
