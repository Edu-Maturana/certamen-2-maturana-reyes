import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_project/Providers/tours_provider.dart';

class CertamenAutosPage extends StatefulWidget {
  //const TabsTourPage({super.key});

  @override
  State<CertamenAutosPage> createState() => _CertamenAutosPageState();
}

class _CertamenAutosPageState extends State<CertamenAutosPage> {
  ProviderAutos autos = ProviderAutos();
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
                'C2 DAM020-CLIENTE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: autos.getAutos(),
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
                          title: Text(snapshot.data['data'][index]['model'] +
                              ' - ' +
                              snapshot.data['data'][index]['vin']),
                          subtitle: Text(snapshot.data['data'][index]['brand'] +
                              ' - ' +
                              '${snapshot.data['data'][index]['year']}'),
                          trailing: Text(
                              '${snapshot.data['data'][index]['price']} CLP'),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
