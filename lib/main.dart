import 'package:flutter/material.dart';
import 'package:parcial2/paginas/home.dart';

void main() {
  runApp(Parcial2());
}

class Parcial2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
