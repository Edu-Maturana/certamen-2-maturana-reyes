import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mobile_project/modelos/carModel.dart';

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
}

class ProviderAutos {
  final apiURL = 'http://10.0.2.2:3000/cars';

  Future getAutos() async {
    var url = Uri.parse(apiURL);
    var respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<http.Response> createAutos(Datos datos) async {
    var url = Uri.parse(apiURL);
    var respuesta = await http.post(url,
        headers: {"content-type": "application/json"},
        body: datosToJson(datos));
    return respuesta;
  }

  Future<http.Response> deleteAutos(Post post) async {
    //BORRAR UN AUTO POR VIN
    var url = Uri.parse(apiURL + '/' + post.vin);
    var respuesta = await http.delete(url);
    return respuesta;
  }
}
