import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mobile_project/modelos/tourModel.dart';

class TourProvider {
  final apiURL = 'http://10.0.2.2:3000/tours';

  Future getTours() async {
    var url = Uri.parse(apiURL);
    var respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<http.Response> addTours(Datos tour) async {
    var url = Uri.parse(apiURL);
    var respuesta = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': tour.name,
          'city': tour.city,
          'description': tour.description,
          'price': tour.price,
          'shedule': tour.shedule,
          'rating': tour.rating,
        }));
    return respuesta;
  }

  Future<http.Response> deleteTours(int id) async {
    var url = Uri.parse(apiURL + '/' + id.toString());
    var respuesta = await http.delete(url);
    return respuesta;
  }

  Future getTour(int id) async {
    var url = Uri.parse(apiURL + '/' + id.toString());
    var respuesta = await http.get(url);
    return respuesta;
  }
}
