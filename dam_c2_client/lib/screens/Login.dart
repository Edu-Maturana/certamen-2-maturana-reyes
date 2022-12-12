import 'package:flutter/material.dart';
import 'package:mobile_project/screens/home_screen.dart';
import 'package:mobile_project/Providers/authProvider.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  String error = '';
  authProvider auth = authProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 48, 47),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color.fromARGB(255, 104, 105, 103),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Inicio de sesión',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextFormField(
                    controller: emailCtrl,
                    decoration: InputDecoration(
                      label: Text('Name'),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: passwordCtrl,
                    decoration: InputDecoration(
                      label: Text('Password'),
                    ),
                    obscureText: true,
                  ),

                  //BOTON LOGIN
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text('INICIAR SESIÓN'),
                      onPressed: () {
                        login();
                      },
                    ),
                  ),

                  //MENSAJES ERROR
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState.validate()) {
      var respuesta = await auth.login(emailCtrl.text, passwordCtrl.text);
      if (respuesta.statusCode == 201) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        setState(() {
          error = 'Usuario o contraseña incorrectos';
        });
      }
    }
  }
}
