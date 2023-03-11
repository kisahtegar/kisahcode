import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisahcode/screens/home/home_page.dart';
import 'package:kisahcode/util/const.dart';

import 'util/firebase_options.dart';

void main() async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FroCode",
      theme: ThemeData.dark().copyWith(
        primaryColor: ColorConst.primaryColor,
        scaffoldBackgroundColor: ColorConst.bgColor,
        canvasColor: ColorConst.bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
              bodyLarge: const TextStyle(color: ColorConst.bodyTextColor),
              bodyMedium: const TextStyle(color: ColorConst.bodyTextColor),
            ),
      ),
      home: const HomePage(),
    );
  }
}
