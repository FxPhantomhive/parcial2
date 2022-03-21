import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial2/constantes/const.dart';

class Carrito extends StatefulWidget {
  Carrito({Key? key}) : super(key: key);

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey[700],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 0, right: 50, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Carrito",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(
                width: 30,
              )
            ],
          ),
        ),
      ),
      body: CarritoLista(),
    );
  }

  Widget CarritoLista() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(Cart.length, (index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 10),
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10, top: 10),
                            width: 80,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(150, 232, 240, 212),
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Cart[index]["imagen"]),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 240,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 150,
                                            child: Text(
                                              Cart[index]["nombre"],
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: 150,
                                            child: Text(
                                              Cart[index]["precio"],
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        child: Icon(AntDesign.closecircleo),
                                        onTap: () {
                                          setState(() {
                                            Cart.remove(Cart[index]);

                                            print(Cart);
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    );
                  })),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$49.98",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
                          Entypo.credit_card,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Pagar",
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
          ],
        )
      ]),
    );
  }
}
