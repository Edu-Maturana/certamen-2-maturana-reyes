import 'package:flutter/material.dart';
import 'package:mobile_project/modelos/tourModel.dart';
import '../Providers/tours_provider.dart';

class DeleteTour extends StatefulWidget {
  String name;

  DeleteTour({this.name});
  @override
  State<DeleteTour> createState() => _DeleteTourState();
}

class _DeleteTourState extends State<DeleteTour> {
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
        title: const Text(
          'ELIMINAR UN TOUR',
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
              controller: _controllerName,
              decoration: InputDecoration(hintText: "Ingrese nombre del tour"),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                String name = _controllerName.text.toString().trim();
                if (name.isEmpty) {
                  showSnackBar("El nombre es obligatorio");
                } else {
                  setState(() {
                    Post post = Post(
                      name: name,
                    );
                    print(_controllerName.text);
                    tour.deleteTours(post).then((respuesta) {
                      setState(() {
                        if (respuesta.statusCode == 200) {
                          showSnackBar("Tour eliminado");
                          Navigator.pop(context, true);
                        } else {
                          showSnackBar("Error al eliminar el tour");
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
