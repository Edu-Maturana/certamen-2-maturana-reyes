import 'package:flutter/material.dart';
import '../Providers/tours_provider.dart';
import 'package:mobile_project/modelos/carModel.dart';

class AddAuto extends StatefulWidget {
  String vin;
  String brand;
  String model;
  int year;
  int price;
  bool _isApiProcess = false;

  AddAuto({this.vin, this.brand, this.model, this.year, this.price});
  @override
  _AddAutoState createState() => _AddAutoState();
}

class _AddAutoState extends State<AddAuto> {
  ProviderAutos autos = ProviderAutos();
  TextEditingController _controllerVin = TextEditingController();
  TextEditingController _controllerBrand = TextEditingController();
  TextEditingController _controllerModel = TextEditingController();
  TextEditingController _controllerYear = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();

  @override
  void initState() {
    _controllerVin.text = widget.vin;
    _controllerBrand.text = widget.brand;
    _controllerModel.text = widget.model;
    _controllerYear.text = widget.year == null ? "0" : toString();
    _controllerPrice.text = widget.price == null ? "0" : toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Auto',
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
                    keyboardType: TextInputType.text,
                    controller: _controllerVin,
                    decoration: InputDecoration(hintText: "Ingrese Patente"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8.0)),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _controllerBrand,
                    decoration: InputDecoration(hintText: "Ingrese Marca"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8.0)),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _controllerModel,
                    decoration: InputDecoration(hintText: "Ingrese Modelo"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8.0)),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _controllerYear,
                    decoration: InputDecoration(hintText: "Ingrese Año"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8.0)),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _controllerPrice,
                    decoration: InputDecoration(hintText: "Ingrese Precio"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 12.0)),
                  widget.vin == null
                      ? OutlinedButton(
                          child: Text("Agregar"),
                          onPressed: () {
                            String vin = _controllerVin.text.toString().trim();
                            String brand =
                                _controllerBrand.text.toString().trim();
                            String model =
                                _controllerModel.text.toString().trim();
                            int year = _controllerYear.text.toString().isEmpty
                                ? 0
                                : int.parse(_controllerYear.text.toString());
                            int price = _controllerPrice.text.toString().isEmpty
                                ? 0
                                : int.parse(_controllerPrice.text.toString());
                            if (vin.isEmpty) {
                              showSnackBar("La patente es obligatoria");
                            } else if (brand.isEmpty) {
                              showSnackBar("La marca es obligatoria");
                            } else if (model.isEmpty) {
                              showSnackBar("El modelo es obligatorio");
                            } else if (year == 0) {
                              showSnackBar("El año es obligatorio");
                            } else if (price == 0) {
                              showSnackBar("El precio es obligatorio");
                            } else {
                              setState(() {
                                widget._isApiProcess = true;
                                Datos datos = Datos(
                                    vin: vin,
                                    brand: brand,
                                    model: model,
                                    year: year,
                                    price: price);
                                autos.createAutos(datos).then((respuesta) {
                                  setState(() {
                                    widget._isApiProcess = false;
                                  });
                                  if (respuesta.statusCode == 200) {
                                    showSnackBar("Auto agregado");
                                    Navigator.pop(context, true);
                                  } else {
                                    showSnackBar("Error al agregar el auto");
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
