import 'package:flutter/material.dart';
import 'package:mobile_project/modelos/tourModel.dart';
import '../Providers/tours_provider.dart';

class buscarTour extends StatefulWidget {
  int id;
  String name;
  String city;
  String description;
  int price;
  String shedule;
  int rating;
  bool _isApiProcess = true;

  buscarTour(
      {this.id,
      this.name,
      this.city,
      this.description,
      this.price,
      this.shedule,
      this.rating});
  @override
  State<buscarTour> createState() => _buscarTourState();
}

class _buscarTourState extends State<buscarTour> {
  TourProvider tour = TourProvider();
  TextEditingController _controllerId = TextEditingController();
  @override
  void initState() {
    _controllerId.text = widget.id == null ? "0" : toString();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Consultar un tour'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Ingresa el id del tour para consultar',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _controllerId,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el id del tour',
              ),
            ),
            OutlinedButton(
              child: Text('Enviar'),
              style: OutlinedButton.styleFrom(
                  fixedSize: const Size(800, 30),
                  primary: Colors.white,
                  backgroundColor: Colors.blue),
              onPressed: () {
                int id = _controllerId.text.isEmpty
                    ? null
                    : int.parse(_controllerId.text);
                if (id == null) {
                  showSnackbarMessage("El id es requerido");
                } else {
                  setState(() {
                    widget._isApiProcess = true;
                    Post post = Post(
                      id: id,
                    );

                    if (widget.id == post.id) {
                      showSnackbarMessage("El tour existe");
                      Expanded(
                        child: FutureBuilder<dynamic>(
                          future: tour.getTour(id),
                          builder: ((context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                  child: Container(
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Cargando datos....'),
                                          CircularProgressIndicator(),
                                        ],
                                      )));
                            } else {
                              return ListView.builder(
                                itemCount: snapshot.data['data'].length,
                                itemBuilder: (context, index) {
                                  print(index);
                                  return ListTile(
                                    title: Text(snapshot.data['data'][index]
                                            ['name'] +
                                        ' - ' +
                                        snapshot.data['data'][index]['city']),
                                    subtitle: Text(
                                        '${snapshot.data['data'][index]['description']}'),
                                    trailing: Text(
                                        ('${snapshot.data['data'][index]['price']} CLP' +
                                            ' - ' +
                                            '${snapshot.data['data'][index]['schedule']}' +
                                            ' - ' +
                                            '${snapshot.data['data'][index]['rating']}')),
                                  );
                                },
                              );
                            }
                          }),
                        ),
                      );
                    } else {
                      showSnackbarMessage("El tour no existe");
                    }
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void showSnackbarMessage(String mensaje) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mensaje)));
  }
}
