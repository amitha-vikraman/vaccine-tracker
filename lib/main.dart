import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyByMcJojqqFmBF_VK-FxfgmfCYFL0MuJBI",
      appId: "1:240443115144:web:f23892bc8b75bf86bd013d",
      messagingSenderId: "240443115144",
      projectId: "vaccine-tracker-a7e87",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initiliazation = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _initiliazation,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("ERROR: ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
