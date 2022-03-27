import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:green_app/services/dialog_service.dart';
import 'package:green_app/services/navigation_service.dart';
import 'package:green_app/ui/router.dart';
import 'package:green_app/ui/views/login_view.dart';
import 'package:green_app/ui/views/signup_view.dart';
import 'package:green_app/ui/views/startup_view.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'managers/dialog_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupLocator();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GreenApp',
          builder: (context, child) => Navigator(
            key: locator<DialogService>().dialogNavigationKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => DialogManager
                  (key: key ,
                child: child)),
          ),
          navigatorKey: locator<NavigationService>().navigationKey,
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.nunitoTextTheme(),
          ),
          home: SignUpView(),
          onGenerateRoute: generateRoute,
        );
      }
  }


