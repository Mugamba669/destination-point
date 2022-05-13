import 'package:admin/Auth/Auth.dart';
import 'package:admin/screens/search/SearchResults.dart';
import 'package:admin/screens/signup/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/Forms/Forms.dart';
import 'screens/Login/login.dart';

import 'package:flutter/material.dart';

import 'screens/Profile/profile.dart';
import 'screens/Receipts/Receipts.dart';
import 'screens/Reports/Reports.dart';
import 'screens/Users/Users.dart';
import 'screens/dashboard/dash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destination Point',
      initialRoute: Auth().isSignedIn() == true ? '/dashboard' : '/',
      routes: {
        '/': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/dashboard': (context) => Dash(),
        '/forms': (context) => Forms(),
        '/reports': (context) => Reports(),
        '/users': (context) => Users(),
        '/receipts': (context) => Receipts(),
        '/search': (context) => SearchResults(),
        '/profile': (context) => Profile(),
      },
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
