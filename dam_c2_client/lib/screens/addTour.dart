import 'package:flutter/material.dart';
import '../Providers/tours_provider.dart';
import 'package:mobile_project/modelos/tourModel.dart';

class AddTour extends StatefulWidget {
  String name;
  String city;
  String description;
  String img;
  int price;
  String schedule;
  int rating;
  bool _isApiProcess = false;

  AddTour(
      {this.name,
      this.city,
      this.description,
      this.img,
      this.price,
      this.schedule,
      this.rating});
  @override
  _AddTourState createState() => _AddTourState();
}

class _AddTourState extends State<AddTour> {
  TourProvider tour = TourProvider();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerImg = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerSchedule = TextEditingController();
  TextEditingController _controllerRating = TextEditingController();

  @override
  void initState() {
    _controllerName.text = widget.name;
    _controllerCity.text = widget.city;
    _controllerDescription.text = widget.description;
    _controllerImg.text = widget.img;
    _controllerPrice.text = widget.price == null ? "0" : toString();
    _controllerSchedule.text = widget.schedule;
    _controllerRating.text = widget.rating == null ? "0" : toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tour',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red,
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
                    controller: _controllerImg,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingresa la imagen',
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
                    controller: _controllerSchedule,
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
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            String name =
                                _controllerName.text.toString().trim();
                            String city =
                                _controllerCity.text.toString().trim();
                            String description =
                                _controllerDescription.text.toString().trim();
                            String img = _controllerImg.text.toString().trim();
                            int price = _controllerPrice.text.toString().isEmpty
                                ? 0
                                : int.parse(_controllerPrice.text.toString());
                            String schedule =
                                _controllerSchedule.text.toString().trim();
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
                            if (img.isEmpty) {
                              showSnackBar("Ingresa la imagen");
                              return;
                            }
                            if (schedule.isEmpty) {
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
                                    name: name,
                                    city: city,
                                    description: description,
                                    img: img,
                                    price: price,
                                    schedule: schedule,
                                    rating: rating);
                                tour.addTours(datos).then((respuesta) {
                                  setState(() {
                                    widget._isApiProcess = false;
                                  });
                                  if (respuesta.statusCode == 201) {
                                    showSnackBar("Tour agregado correctamente");
                                    Navigator.pop(context, true);
                                  } else {
                                    showSnackBar("Error al agregar el tour" +
                                        respuesta.body);
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
