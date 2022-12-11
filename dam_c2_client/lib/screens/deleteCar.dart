import 'package:flutter/material.dart';
import 'package:mobile_project/modelos/carModel.dart';
import '../Providers/tours_provider.dart';

class DeleteAuto extends StatefulWidget {
  String vin;

  DeleteAuto({this.vin});
  @override
  State<DeleteAuto> createState() => _DeleteAutoState();
}

class _DeleteAutoState extends State<DeleteAuto> {
  ProviderAutos autos = ProviderAutos();
  TextEditingController _controllerVin = TextEditingController();
  @override
  void initState() {
    _controllerVin.text = widget.vin;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ELIMINAR UN AUTO',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _controllerVin,
              decoration: InputDecoration(hintText: "Ingrese Patente"),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                String vin = _controllerVin.text.toString().trim();
                if (vin.isEmpty) {
                  showSnackBar("La patente es obligatoria");
                } else {
                  setState(() {
                    Post post = Post(
                      vin: vin,
                    );
                    print(_controllerVin.text);
                    autos.deleteAutos(post).then((respuesta) {
                      setState(() {
                        if (respuesta.statusCode == 200) {
                          showSnackBar("Auto eliminado");
                          Navigator.pop(context, true);
                        } else {
                          showSnackBar("Error al eliminar el auto");
                        }
                      });
                    });
                  });
                }
              },
              child: Text('Eliminar'),
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
