import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled5_clase10/pages/home_page.dart';



void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WeatherApp",
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      home: HomePage(),
    );
  }
}
