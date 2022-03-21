import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:parcial2/constantes/const.dart';
import 'package:parcial2/paginas/carrito.dart';

class DetalleProducto extends StatefulWidget {
  final String nombre;
  final String descripcion;
  final String imagen;
  final int indice1;
  final int indice2;

  DetalleProducto(
      {Key? key,
      required this.nombre,
      required this.descripcion,
      required this.imagen,
      required this.indice1,
      required this.indice2})
      : super(key: key);

  @override
  State<DetalleProducto> createState() => _DetalleProductoState();
}

class _DetalleProductoState extends State<DetalleProducto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey[700],
        backgroundColor: Color.fromARGB(150, 232, 240, 212),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40,
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
      ),
      body: Tarjeta(),
    );
  }

  Widget Tarjeta() {
    return SingleChildScrollView(
        child: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(150, 232, 240, 212),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            padding:
                const EdgeInsets.only(top: 0, bottom: 15, left: 70, right: 40),
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 170,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(selected), fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: Icon(
                        Icons.favorite_outlined,
                        color: Colors.pink,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.only(left: 20, top: 30, right: 25),
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.nombre,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  Text(
                    "\$24.99",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Row(
                children: [
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 15.0,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.2),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Text(
                    " 200 Reviews",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                widget.descripcion,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  "Color",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = "assets/images/s2.png";
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 231, 172, 10),
                        ),
                        color: Color.fromARGB(255, 231, 172, 10),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = "assets/images/s3.png";
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                        ),
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = "assets/images/s4.png";
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 250, 231, 171),
                        ),
                        color: Color.fromARGB(255, 250, 231, 171),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = "assets/images/s1.png";
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(171, 112, 83, 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Entypo.shopping_bag,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Comprar",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ]),
    ));
  }
}
