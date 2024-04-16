import 'package:flutter/material.dart';

class ListaComp extends StatelessWidget {
  final String nomeLista;
  final VoidCallback? onExcluir;

  const ListaComp({super.key, required this.nomeLista, this.onExcluir});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
          IconButton(
            onPressed: onExcluir,
            icon: const Icon(Icons.delete, color: Color.fromARGB(255, 191, 21, 21),),
          ),
        ],
      ),
    );
  }
}
