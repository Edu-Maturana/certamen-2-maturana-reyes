import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_project/Providers/tours_provider.dart';
import 'package:flushbar/flushbar.dart';
import 'Login.dart';

class CertamenTourPage extends StatefulWidget {
  @override
  State<CertamenTourPage> createState() => _CertamenTourPageState();
}

class _CertamenTourPageState extends State<CertamenTourPage> {
  TourProvider tour = TourProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.red,
              title: Text(
                'C3 DAM020-CLIENTE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'logout',
                      child: Text('Cerrar sesión'),
                    )
                  ],
                  onSelected: (opcion) {
                    if (opcion == 'logout') {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                  },
                )
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: tour.getTours(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: Container(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Cargando datos....'),
                                CircularProgressIndicator(),
                              ],
                            )));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data['data'].length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 104, 105, 103),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            title: Text(snapshot.data['data'][index]['name'] +
                                ' - ' +
                                snapshot.data['data'][index]['city'] +
                                '\n Id: ' +
                                '${snapshot.data['data'][index]['id']}'),
                            leading: Image.network(
                                snapshot.data['data'][index]['img']),
                            trailing: Text(
                                '${snapshot.data['data'][index]['price']} CLP' +
                                    '\n Horario: ' +
                                    '${snapshot.data['data'][index]['schedule']}' +
                                    ' \n Valoración: ' +
                                    '${snapshot.data['data'][index]['rating']}' +
                                    ' ' +
                                    '⭐'),
                            onLongPress: () {
                              (MessageWidget.info(
                                  context,
                                  snapshot.data['data'][index]['description'],
                                  6));
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Add');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Text('Agregar'),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Delete');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: Text('Eliminar'),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageWidget {
  TourProvider tour = TourProvider();
  static void info(BuildContext context, String message, int seconds) {
    Flushbar(
      title: 'Descripción',
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: seconds),
    )..show(context);
  }
}
