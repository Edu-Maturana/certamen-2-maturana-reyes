import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

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
