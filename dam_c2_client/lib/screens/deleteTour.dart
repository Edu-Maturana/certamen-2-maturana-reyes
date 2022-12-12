import 'package:flutter/material.dart';
import 'package:mobile_project/modelos/tourModel.dart';
import '../Providers/tours_provider.dart';

class DeleteTour extends StatefulWidget {
  int id;

  DeleteTour({this.id});
  @override
  State<DeleteTour> createState() => _DeleteTourState();
}

class _DeleteTourState extends State<DeleteTour> {
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
        title: const Text(
          'ELIMINAR UN TOUR',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
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
              controller: _controllerId,
              decoration: InputDecoration(hintText: "Ingrese el id del tour"),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                int id = _controllerId.text.isEmpty
                    ? null
                    : int.parse(_controllerId.text);
                if (id == null) {
                  showSnackBar("El nombre es obligatorio");
                } else {
                  setState(() {
                    Post post = Post(
                      id: id,
                    );
                    print(_controllerId.text);
                    tour.deleteTours(id).then((respuesta) {
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
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
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
