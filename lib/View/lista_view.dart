import 'package:flutter/material.dart';

class ListaView extends StatelessWidget {
  final String nomeLista;
  final List<String> lista;

  const ListaView({Key? key, required this.nomeLista, required this.lista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomeLista),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lista[index]),
          );
        },
      ),
    );
  }
}
