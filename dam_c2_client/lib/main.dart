import 'package:flutter/material.dart';
import 'package:mobile_project/screens/ProductsScreen.dart';
import 'package:mobile_project/screens/certamen.dart';
import 'package:mobile_project/screens/addCar.dart';
import 'package:mobile_project/screens/home_screen.dart';
import 'package:mobile_project/screens/deleteCar.dart';

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
        '/certamen': (context) => CertamenAutosPage(),
        '/Add': (context) => AddAuto(),
        '/Delete': (context) => DeleteAuto(),
      },
    );
  }
}
