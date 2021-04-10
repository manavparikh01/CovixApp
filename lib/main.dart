import 'package:abcd/view/homePage.dart';
import 'package:abcd/view/loginPage.dart';
import 'package:abcd/view/waitingListScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomePage(),
          );
        }
        return Center(child: CircularProgressIndicator());

        // return MaterialApp(
        //     debugShowCheckedModeBanner: false,
        //     title: 'Flutter Demo',
        //     theme: ThemeData(
        //       primarySwatch: Colors.blue,
        //       visualDensity: VisualDensity.adaptivePlatformDensity,
        //     ),
        //     home: HomePage());
      },
    );
  }
}
