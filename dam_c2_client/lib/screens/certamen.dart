import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_project/Providers/tours_provider.dart';
import 'package:mobile_project/screens/buscarCar.dart';

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
              title: Text(
                'C3 DAM020-CLIENTE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
                        return ListTile(
                          title: Text(snapshot.data['data'][index]['name'] +
                              ' - ' +
                              snapshot.data['data'][index]['city']),
                          subtitle:
                              Text(snapshot.data['data'][index]['description']),
                          trailing: Text(
                              '${snapshot.data['data'][index]['price']} CLP' +
                                  ' - ' +
                                  '${snapshot.data['data'][index]['schedule']}' +
                                  ' - ' +
                                  '${snapshot.data['data'][index]['rating']}'),
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
                  child: Text('Agregar'),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Delete');
                  },
                  child: Text('Eliminar'),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return buscarTour(
                        name: 'name',
                        city: 'city',
                        description: 'description',
                        price: 0,
                        shedule: 'shedule',
                        rating: 0,
                      );
                    }));
                  },
                  child: Text('Buscar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
