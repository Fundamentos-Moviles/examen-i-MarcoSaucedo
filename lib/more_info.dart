import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  List<int> contenedores = [];
  int divisiones = 0;

  void agregarContenedor() {
    setState(() {
      if (divisiones == 12) {
        contenedores.add(divisiones);
        divisiones = 1;
      } else {
        divisiones++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  fixedSize: const Size(310, 40),
                ),
                onPressed: agregarContenedor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Agregar cuadrito',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contenedores.length + (divisiones > 0 ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < contenedores.length) {
                    return crearContenedor(contenedores[index]);
                  } else if (divisiones > 0) {
                    return crearContenedor(divisiones);
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget crearContenedor(int divisiones) {
    List<Color> colores = [
      Colors.red,
      Colors.blue
    ];

    return Container(
      color: colores[divisiones % 2],
      child: Row(
        children: List.generate(divisiones, (index) {
          return Expanded(
            child: Container(
              height: 150,
              color: colores[index % 2],
            ),
          );
        }),
      ),
    );
  }
}

