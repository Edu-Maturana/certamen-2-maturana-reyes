import 'package:flutter/material.dart';
import '../Providers/tours_provider.dart';
import 'package:mobile_project/modelos/tourModel.dart';

class AddTour extends StatefulWidget {
  int id;
  String name;
  String city;
  String description;
  int price;
  String shedule;
  int rating;
  bool _isApiProcess = false;

  AddTour(
      {this.id,
      this.name,
      this.city,
      this.description,
      this.price,
      this.shedule,
      this.rating});
  @override
  _AddTourState createState() => _AddTourState();
}

class _AddTourState extends State<AddTour> {
  TourProvider tour = TourProvider();
  TextEditingController _controllerId = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerShedule = TextEditingController();
  TextEditingController _controllerRating = TextEditingController();

  @override
  void initState() {
    _controllerId.text = widget.id == null ? "0" : toString();
    _controllerName.text = widget.name;
    _controllerCity.text = widget.city;
    _controllerDescription.text = widget.description;
    _controllerPrice.text = widget.price.toString();
    _controllerShedule.text = widget.shedule;
    _controllerRating.text = widget.rating == null ? "0" : toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tour',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            (widget._isApiProcess)
                ? Stack(children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(child: CircularProgressIndicator()),
                  ])
                : Column(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _controllerId,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa el id',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _controllerName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa el nombre',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _controllerCity,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa la ciudad',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _controllerDescription,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa la descripción',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _controllerPrice,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa el precio',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _controllerShedule,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa el horario',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _controllerRating,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa el rating',
                    ),
                  ),
                  widget.name == null
                      ? OutlinedButton(
                          child: Text("Agregar"),
                          onPressed: () {
                            int id = _controllerId.text.toString().isEmpty
                                ? 0
                                : int.parse(_controllerId.text.toString());
                            String name =
                                _controllerName.text.toString().trim();
                            String city =
                                _controllerCity.text.toString().trim();
                            String description =
                                _controllerDescription.text.toString().trim();
                            int price = _controllerPrice.text.toString().isEmpty
                                ? 0
                                : int.parse(_controllerPrice.text.toString());
                            String shedule =
                                _controllerShedule.text.toString().trim();
                            int rating = _controllerRating.text
                                    .toString()
                                    .isEmpty
                                ? 0
                                : int.parse(_controllerRating.text.toString());

                            if (name.isEmpty) {
                              showSnackBar("Ingresa el nombre");
                              return;
                            }
                            if (city.isEmpty) {
                              showSnackBar("Ingresa la ciudad");
                              return;
                            }
                            if (description.isEmpty) {
                              showSnackBar("Ingresa la descripción");
                              return;
                            }
                            if (shedule.isEmpty) {
                              showSnackBar("Ingresa el horario");
                              return;
                            }
                            if (price == 0) {
                              showSnackBar("Ingresa el precio");
                              return;
                            }
                            if (rating == 0) {
                              showSnackBar("Ingresa el rating");
                              return;
                            } else {
                              setState(() {
                                widget._isApiProcess = true;
                                Datos datos = Datos(
                                    id: id,
                                    name: name,
                                    city: city,
                                    description: description,
                                    price: price,
                                    shedule: shedule,
                                    rating: rating);
                                tour.createTours(datos).then((respuesta) {
                                  setState(() {
                                    widget._isApiProcess = false;
                                  });
                                  if (respuesta.statusCode == 201) {
                                    showSnackBar("Tour agregado correctamente");
                                    Navigator.pop(context, true);
                                  } else {
                                    showSnackBar("Error al agregar el tour");
                                  }
                                });
                              });
                            }
                          })
                      : OutlinedButton(
                          child: Text("Actualizar cambios"),
                          onPressed: () {},
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
