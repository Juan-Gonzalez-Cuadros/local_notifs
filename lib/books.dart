import 'package:flutter/material.dart';

class Books extends StatelessWidget {
  final dynamic datos;
  Books({Key? key, this.datos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book"),
      ),
      body: Center(
        child: Container(
          child: Text("Datos: ${datos ?? "Sin datos que mostrar"}"),
        ),
      ),
    );
  }
}
