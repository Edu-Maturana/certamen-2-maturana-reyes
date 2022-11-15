import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_project/Providers/tours_provider.dart';

class TabsTourPage extends StatefulWidget {
  //const TabsTourPage({super.key});

  @override
  State<TabsTourPage> createState() => _TabsTourPageState();
}

class _TabsTourPageState extends State<TabsTourPage> {
  TourProvider tours = TourProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Lista de Tours',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: tours.getTours(),
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
                          title: Text(snapshot.data['data'][index]['name']),
                          subtitle: Text(snapshot.data['data'][index]['city']),
                          trailing: Text(
                              '${snapshot.data['data'][index]['price']} CLP'),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
