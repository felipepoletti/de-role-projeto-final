import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_api_flutter_course/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'consts/global_colors.dart';
import 'screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpoverrides();
  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
}

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
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

      home:  const LoginScreen(),
    );
  }
}
