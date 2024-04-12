import 'package:flutter/material.dart';

class ListaComp extends StatelessWidget {
  final String nomeLista;
  final VoidCallback? onExcluir;

  const ListaComp({Key? key, required this.nomeLista, this.onExcluir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
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
            icon: Icon(Icons.delete, color: Color.fromARGB(255, 191, 21, 21),),
          ),
        ],
      ),
    );
  }
}
