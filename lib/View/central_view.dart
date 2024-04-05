import 'package:flutter/material.dart';
import 'package:lista_de_compras/Componentes/lista_comp.dart';

class CentralView extends StatefulWidget {
  const CentralView({Key? key}) : super(key: key);

  @override
  State<CentralView> createState() => _CentralViewState();
}

class _CentralViewState extends State<CentralView> {
  List<String> listaDeNomes = ['Lista 1', 'Lista 2', 'Lista 3','Lista 4']; // Exemplo de lista de nomes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sua Lista de Compras'),
      ),
      body: ListView.builder(
        itemCount: listaDeNomes.length,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              width: 350, 
              height: 100, 
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListaComp(nomeLista: listaDeNomes[index]), // Passa o nome da lista para o componente ListaComp
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para adicionar uma nova lista
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
