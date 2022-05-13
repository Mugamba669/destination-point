import 'package:admin/Auth/Auth.dart';
import 'package:admin/screens/search/SearchResults.dart';
import 'package:admin/screens/signup/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wiredash/wiredash.dart';

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
    final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
    return Wiredash(
      projectId: "destinationpoint-ysmr7jm",
      secret: "trIpAaHP-jBEqOuFl1iNFrbQcVID9AH_",
      options: WiredashOptionsData(
        /// Change the locale of the Wiredash UI
        locale: Locale('en'),

        /// Uncomment below to disable the screenshot step
        // screenshotStep: false,

        /// Uncomment below to disable different buttons
        // bugReportButton: false,
        // featureRequestButton: false,
        // praiseButton: false,

        /// Uncomment below to set custom translations work
        // customTranslations: {
        //   const Locale.fromSubtags(languageCode: 'en'):
        //       const CustomDemoTranslations(),
        // },

        /// Uncomment below to override the default device locale
        // and/or text direction
        // locale: const Locale('de'),
        // textDirection: TextDirection.rtl,
      ),
      theme: WiredashThemeData(

          /// Uncomment below to explore the various theme options:

          /// Customize the Font Family
          // fontFamily: 'Monospace',

          /// Customize the Bottom Sheet Border Radius
          // sheetBorderRadius: BorderRadius.zero,

          /// Customize Brightness and Colors
          // brightness: Brightness.light,
          // primaryColor: Colors.red,
          // secondaryColor: Colors.blue,

          /// Customize the Pen Colors
          /// Note: If you change the Pen Colors, please consider providing
          /// custom translations to the WiredashOptions to ensure the app is
          /// accessible to all. The default translations describe the default
          /// pen colors.
          // firstPenColor: Colors.orange,
          // secondPenColor: Colors.green,
          // thirdPenColor: Colors.yellow,
          // fourthPenColor: Colors.deepPurpleAccent,
          ),
      navigatorKey: _navigatorKey, //
      child: MaterialApp(
        navigatorKey: _navigatorKey,
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
      ),
    );
  }
}
