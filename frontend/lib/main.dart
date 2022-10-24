import 'package:flutter/material.dart';
import 'consts/global_colors.dart';
import 'screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 3.0.4 ',
      theme: ThemeData(
        scaffoldBackgroundColor: mainColor,
        primaryColor: lightCardColor,
        backgroundColor: mainColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: lightIconsColor,
          ),

          backgroundColor: mainColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
        iconTheme: IconThemeData(
          color: lightIconsColor,
        ),

        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,

          // selectionHandleColor: Colors.blue,
        ),
        primarySwatch: Colors.blue,

        textTheme: GoogleFonts.ptSansTextTheme(),

        cardColor: lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: lightIconsColor,
              brightness: Brightness.light,
            ),
      ),

      home: const HomeScreen(),
    );
  }
}
