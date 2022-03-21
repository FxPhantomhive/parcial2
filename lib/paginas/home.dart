import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial2/constantes/const.dart';
import 'package:parcial2/paginas/detalleproducto.dart';
import 'package:parcial2/paginas/carrito.dart';

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

int activoMenu1 = 0;

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: mostrarAppBar(),
      ),
      body: CuerpoApp(),
    );
  }

  //Appbar
  Widget mostrarAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Entypo.list,
              color: Colors.grey[700],
            ),
            GestureDetector(
              child: Icon(
                Feather.shopping_bag,
                color: Colors.grey[700],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        alignment: Alignment.bottomCenter,
                        child: Carrito(),
                        type: PageTransitionType.scale));
              },
            ),
          ],
        ),
      ),
    );
  }

  //Cuerpo de la app
  Widget CuerpoApp() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text("Comercial Felix",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        )),
                  ])),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Column(children: <Widget>[
                    Buscar("Buscar..."),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: List.generate(Tienda.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activoMenu1 = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Tienda[index]['tipo'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: activoMenu1 == index
                                      ? Colors.cyan[700]
                                      : Colors.grey),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            activoMenu1 == index
                                ? Container(
                                    width: 40,
                                    height: 2,
                                    decoration: BoxDecoration(
                                        color: Colors.cyan[700],
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children:
                  List.generate(Tienda[activoMenu1]['datos'].length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: DetalleProducto(
                                nombre: Tienda[activoMenu1]['datos'][index]
                                    ["nombre"],
                                descripcion: Tienda[activoMenu1]['datos'][index]
                                    ["descripcion"],
                                imagen: Tienda[activoMenu1]['datos'][index]
                                    ["imagen"],
                                indice1: activoMenu1,
                                indice2: index,
                              ),
                              type: PageTransitionType.scale));
                      setState(() {
                        selected =
                            Tienda[activoMenu1]['datos'][index]["imagen"];
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 25, right: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(150, 232, 240, 212),
                          ),
                          width: 150,
                          height: 180,
                          child: Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Tienda[activoMenu1]
                                        ['datos'][index]["imagen"]),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.favorite_outlined,
                                    color: Colors.pink,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: const EdgeInsets.only(top: 5, left: 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    Tienda[activoMenu1]['datos'][index]
                                        ["nombre"],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[900],
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    Tienda[activoMenu1]['datos'][index]
                                        ["precio"],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        //Segundo bloque de codigo
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children:
                  List.generate(Tienda[activoMenu1]['datos'].length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: DetalleProducto(
                                nombre: Tienda[activoMenu1]['datos'][index]
                                    ["nombre"],
                                descripcion: Tienda[activoMenu1]['datos'][index]
                                    ["descripcion"],
                                imagen: Tienda[activoMenu1]['datos'][index]
                                    ["imagen"],
                                indice1: activoMenu1,
                                indice2: index,
                              ),
                              type: PageTransitionType.scale));
                      setState(() {
                        selected =
                            Tienda[activoMenu1]['datos'][index]["imagen"];
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 25, right: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(150, 232, 240, 212),
                          ),
                          width: 150,
                          height: 180,
                          child: Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Tienda[activoMenu1]
                                        ['datos'][index]["imagen"]),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.favorite_outlined,
                                    color: Colors.pink,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: const EdgeInsets.only(top: 5, left: 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(children: [
                              Text(
                                Tienda[activoMenu1]['datos'][index]["nombre"],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[900],
                                ),
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                Tienda[activoMenu1]['datos'][index]["precio"],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ]),
    );
  }

  Widget Buscar(String dato) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: TextField(
        decoration: InputDecoration(
            hintText: dato,
            fillColor: Color.fromARGB(150, 232, 240, 212),
            filled: true,
            prefixIcon: Icon(Entypo.magnifying_glass),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(150, 232, 240, 212)))),
      ),
    );
  }
}
