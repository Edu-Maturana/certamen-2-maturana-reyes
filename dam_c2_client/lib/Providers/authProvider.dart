import 'dart:convert';
import 'package:http/http.dart' as http;

class authProvider {
  final apiURL = 'http://10.0.2.2:3000/auth/';

  Future login(String email, String password) async {
    var url = Uri.parse(apiURL + 'login');
    var respuesta = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({'name': email, 'password': password}));
    return respuesta;
  }
}
