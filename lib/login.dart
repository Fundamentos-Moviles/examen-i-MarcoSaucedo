import 'package:flutter/material.dart';
import 'package:examen1_srmj/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  final pass = TextEditingController();

  // Variable para almacenar el mensaje de error
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff64011f), // Color de fondo para toda la pantalla
        child: Stack(
          children: [
            // Fondo dividido en 3 partes usando un Column con Rows y Expanded
            Column(
              children: [
                // Primer fila de contenedores de colores
                Container(
                  height: 204,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff520120),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff64011f),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff41011a),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffb20222),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Segunda fila de contenedores
                Container(
                  height: 204,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffb20222),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff41011a),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff520120),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff64011f),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Tercera fila de contenedores
                Container(
                  height: 204,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff41011a),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffb20222),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff64011f),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff520120),
                            borderRadius: BorderRadius.circular(25), // Bordes redondeados
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Contenido encima del fondo
            Padding(
              padding: const EdgeInsets.only(top: 115.0, left: 50.0, right: 50.0),
              child: Container(
                height: 380,
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withOpacity(0.6), // Fondo con opacidad
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Bienvenido a tu primer EXAMEN',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff520120),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: user,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Correo/Usuario',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Contraseña',
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // Mostrar el mensaje de error (si existe)
                    if (errorMessage != null)
                      Text(
                        errorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    const SizedBox(height: 20.0),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffa65476),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        fixedSize: const Size(200, 40),
                      ),
                      onPressed: () {
                        setState(() {
                          print('Usuario: ${user.text}');
                          print("Contraseña: ${pass.text}");

                          // Verificar credenciales
                          if (user.text == "test" && pass.text == "FDM1") {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Home()));
                          } else if (user.text.isEmpty && pass.text.isEmpty) {
                            print('Datos incompletos');
                            errorMessage = 'Datos incompletos';
                          } else if (user.text == "test" && pass.text != "FDM1") {
                            print('Contraseña incorrecta');
                            errorMessage = 'Contraseña incorrecta';
                          } else if (user.text != "test" && pass.text == "FDM1") {
                            print('Usuario incorrecto');
                            errorMessage = 'Usuario incorrecto';
                          } else {
                            errorMessage = 'Credenciales incorrectas';
                          }
                        });
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Mi primer examen,¿estará sencillo?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
