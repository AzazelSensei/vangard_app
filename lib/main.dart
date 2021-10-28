import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vangard_app/pages/view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.nunitoTextTheme().copyWith(
                headline2: const TextStyle(fontWeight: FontWeight.w600))),
        debugShowCheckedModeBanner: false,
        // ignore: prefer_const_constructors
        home: LoginPage());
  }
}
