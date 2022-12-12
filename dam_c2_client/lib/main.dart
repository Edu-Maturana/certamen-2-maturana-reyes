import 'package:flutter/material.dart';
import 'package:mobile_project/screens/Login.dart';
import 'package:mobile_project/screens/ProductsScreen.dart';
import 'package:mobile_project/screens/searchTour.dart';
import 'package:mobile_project/screens/certamen.dart';
import 'package:mobile_project/screens/addTour.dart';
import 'package:mobile_project/screens/home_screen.dart';
import 'package:mobile_project/screens/deleteTour.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viajes al Sur',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 176, 18, 0),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/Tours': (context) => TabsTourPage(),
        '/certamen': (context) => CertamenTourPage(),
        '/Add': (context) => AddTour(),
        '/Delete': (context) => DeleteTour(),
        '/Search': (context) => buscarTour(),
      },
    );
  }
}
