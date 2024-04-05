import 'package:flutter/material.dart';

class ListaComp extends StatelessWidget {
  final String nomeLista;

  const ListaComp({Key? key, required this.nomeLista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 50,
            color: Color.fromARGB(255, 159, 20, 223),
          ),
          const SizedBox(height: 10),
          Text(
            nomeLista,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
