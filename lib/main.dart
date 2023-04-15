import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/authentication/signInScreen.dart';
import 'Widgets/BottomNavigBar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    runApp(const getData());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           useMaterial3: true,
//           primarySwatch: Colors.orange,
//         ),
//         home: FutureBuilder(
//           // Initialize FlutterFire
//           future: Firebase.initializeApp(),
//           builder: (context, snapshot) {
//             // Check for errors
//             if (snapshot.hasError) {
//               return const Text("Some thing Went Wrong");
//             }

//             // Once complete, show your application
//             if (snapshot.connectionState == ConnectionState.done) {
//               return getData();
//             }

//             // Otherwise, show something whilst waiting for initialization to complete
//             return const Center(child: CircularProgressIndicator());
//           },
//         ));
//   }
// }

class getData extends StatelessWidget {
  const getData({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;


    final User? user = FirebaseAuth.instance.currentUser;
    get_Data() async {
      final DocumentSnapshot snapshot =
          await firestore.collection("users").doc(user?.uid).get();
      // storage.write(key: "UID", value: user.user?.uid);
      if (snapshot.exists) {
        return snapshot.data();
      }
      return null;
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.orange,
        ),
        home: FutureBuilder(
        future: get_Data(),
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
      ),
    );
  }
}
