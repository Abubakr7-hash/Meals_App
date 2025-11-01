import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals_app/views/screens/tabs.dart';

//!/ ///////////// MyTheme ////////////////////////////
final myTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
//! /////////////// Main Functino ////////////////////
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

//!/ ////////////////Main Material App //////////////////
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: const TabsScreen(),
    );
  }
}
