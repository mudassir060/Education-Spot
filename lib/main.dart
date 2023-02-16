import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/authentication/signInScreen.dart';
import 'Widgets/BottomNavigBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.orange,
        ),
        home: FutureBuilder(
          // Initialize FlutterFire
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return const Text("Some thing Went Wrong");
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return signInScreen();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class getData extends StatefulWidget {
  const getData({super.key});

  @override
  State<getData> createState() => _getDataState();
}

class _getDataState extends State<getData> {

  @override
  Widget build(BuildContext context) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

        FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
  getData() async {
    final DocumentSnapshot snapshot =
        await firestore.collection("users").doc(user?.uid).get();
    // storage.write(key: "UID", value: user.user?.uid);
    if (snapshot.exists) {
      return snapshot.data();
    }
    return null;
  }

    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Some thing Went Wrong");
        }

        // Once complete, show your application
        if (snapshot.hasData) {
          return BottomNavigBar(UserData: snapshot.data as Map);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return signInScreen();
      },
    );
  }
}
