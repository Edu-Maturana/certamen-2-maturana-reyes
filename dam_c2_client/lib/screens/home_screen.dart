import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_project/screens/Login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.powerOff,
    FontAwesomeIcons.star,
    FontAwesomeIcons.map,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          if (_selectedIndex < 2) {
            if (_selectedIndex == 0) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            }
          } else if (_selectedIndex == 1) {
            Navigator.pushNamed(context, '/Tours');
          } else if (_selectedIndex == 2) {
            Navigator.pushNamed(context, '/certamen');
          }
        });
      },
      child: Column(
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? Theme.of(context).accentColor
                  : Color(0xFFE7EBEE),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Icon(
              _icons[index],
              size: 25.0,
              color: _selectedIndex == index
                  ? Theme.of(context).primaryColor
                  : Color(0xFFB4C1C4),
            ),
          ),
        ],
      ),
    );
  }

// build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '¿Dónde te gustaría ir?',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIcon(0),
                _buildIcon(1),
                _buildIcon(2),
              ],
            ),
            SizedBox(height: 20.0),
            //widgetDestino(),
          ],
        ),
      ),
    );
  }
}
