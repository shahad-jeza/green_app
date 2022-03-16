import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_app/Screens/Welcome/Welcome_screen.dart';
import 'package:green_app/Screens/wrapper.dart';
import 'package:green_app/authentication.dart';
import 'package:green_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: null,
      value: Authentication().onAuthStateChanged,
        builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Auth',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.nunitoTextTheme(),
          ),
          home: wrapper(),
        );
      }
    );
  }
}
