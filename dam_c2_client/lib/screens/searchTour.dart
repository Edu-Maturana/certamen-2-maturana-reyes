import 'package:flutter/material.dart';
import 'package:mobile_project/modelos/tourModel.dart';
import '../Providers/tours_provider.dart';

class buscarTour extends StatefulWidget {
  String name;
  String city;
  String description;
  int price;
  String shedule;
  int rating;
  bool _isApiProcess = true;

  buscarTour(
      {this.name,
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
  TextEditingController _controllerName = TextEditingController();
  @override
  void initState() {
    _controllerName.text = widget.name;
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
        title: Text('Consultar un producto'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Ingresa el codigo del producto para consultar',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _controllerName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa el codigo',
              ),
            ),
            OutlinedButton(
              child: Text('Enviar'),
              style: OutlinedButton.styleFrom(
                  fixedSize: const Size(800, 30),
                  primary: Colors.white,
                  backgroundColor: Colors.blue),
              onPressed: () {
                String name = _controllerName.text.toString().trim();
                if (name.isEmpty) {
                  showSnackbarMessage("El nombre es requerido");
                } else {
                  setState(() {
                    widget._isApiProcess = true;
                    Post post = Post(
                      name: name,
                    );

                    if (post == widget.name) {
                      showSnackbarMessage("El tour existe");
                      Expanded(
                        child: FutureBuilder<dynamic>(
                          future: tour.getToursName(_controllerName.text),
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
