import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'menuScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Something went wrong!"),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Center(
                child: PratikRehber(),
              ),
            );
          }

          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
        },
      ),
    );
  }
}
