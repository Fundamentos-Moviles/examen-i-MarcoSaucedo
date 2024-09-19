import 'package:flutter/material.dart';
import 'package:examen1_srmj/utils/constants.dart' as con;
import 'package:examen1_srmj/more_info.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;

  @override
  void initState() {
    lista = List.from(con.lista);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Color(0xff015c64),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          "Notificaciones de actividades",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff948800),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    padding: EdgeInsets.all(20.0),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: lista.length,
                      itemBuilder: (BuildContext context, int index) {
                        var datos = lista[index].toString().split('#');
                        print('ID: ${datos[0]}');

                        return Column(
                          children: [
                            datos[5] == '1'
                                ? createCard(
                              id: datos[0],
                              numero: datos[1],
                              txtTitulo: datos[2],
                              txtDescripcion: datos[3],
                              NumEstrellas: datos[4],
                            )
                                : createdCard2(
                              int.parse(datos[0]),
                              datos[1],
                              datos[2],
                              datos[3],
                              datos[4],
                              onDelete: () {
                                setState(() {
                                  lista.removeAt(index);
                                  showSnackBar('Se eliminó el elemento con el id: ${datos[0]}', 15);
                                });
                              },
                            ),
                            SizedBox(height: 20.0),
                          ],
                        );
                      },
                    ),
                  ),
                  Text(
                      'SEGUNDA VISTA: Saucedo Ramos Marco Jesús',
                          style: TextStyle(
                            color: Color(0xff948800),
                            fontSize: 20,
                          ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container createdCard2(int id, String numero, String txtTitulo, String txtDescripcion, String NumEstrellas, {required VoidCallback onDelete}) {
    int totalEstrellas = 5;
    int estrellasAmarillas = int.tryParse(NumEstrellas) ?? 0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(

        children: [
          Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              numero,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.lightBlue,
                              ),

                            ),
                            InkWell(
                              child: Icon(
                                Icons.access_alarm,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    txtTitulo,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    txtDescripcion,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(totalEstrellas, (index) {
                      return Icon(
                        Icons.star,
                        color: index < estrellasAmarillas ? Colors.yellowAccent : Colors.grey,
                        size: 15,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 2.0, right: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MoreInfo()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 23),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Ver más',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onDelete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Borrar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String texto, int duracion) {
    final snackBar = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion),
      backgroundColor: con.efectos,
      action: SnackBarAction(
        onPressed: () {
        },
        label: 'Cerrar',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}

class createCard extends StatelessWidget {
  final String id;
  final String numero;
  final String txtTitulo;
  final String txtDescripcion;
  final String NumEstrellas;

  const createCard({
    super.key,
    required this.id,
    required this.numero,
    required this.txtTitulo,
    required this.txtDescripcion,
    required this.NumEstrellas,
  });

  @override
  Widget build(BuildContext context) {
    int totalEstrellas = 5;
    int estrellasAmarillas = int.tryParse(NumEstrellas) ?? 0;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoreInfo(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    numero,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.access_alarm,
                  ),
                ),
              ],
            ),
            Text(
              txtTitulo,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              txtDescripcion,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(totalEstrellas, (index) {
                return Icon(
                  Icons.star,
                  color: index < estrellasAmarillas
                      ? Colors.yellowAccent
                      : Colors.grey,
                  size: 15,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

