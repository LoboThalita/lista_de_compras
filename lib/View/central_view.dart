import 'package:flutter/material.dart';
import 'package:lista_de_compras/Componentes/lista_comp.dart';
import 'package:lista_de_compras/View/nova_lista_view.dart';
import 'package:lista_de_compras/simula_bd.dart';
import 'package:lista_de_compras/View/lista_view.dart';

class CentralView extends StatefulWidget {
  const CentralView({super.key});

  @override
  State<CentralView> createState() => _CentralViewState();
}

class _CentralViewState extends State<CentralView> {
  List<String> listaDeNomes = SimulaBD.recuperarListas();
  int _hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suas Listas de Compras'),
      ),
      body: ListView.builder(
        itemCount: listaDeNomes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaView(
                    nomeLista: listaDeNomes[index],
                    itens: SimulaBD.recuperarItens(listaDeNomes[index]),
                  ),
                ),
              );
            },
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  _hoverIndex = index;
                });
              },
              onExit: (_) {
                setState(() {
                  _hoverIndex = -1;
                });
              },
              child: Center(
                child: Container(
                  width: 350,
                  height: 100,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: _hoverIndex == index
                        ? const Color.fromARGB(255, 220, 187, 251)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListaComp(
                    nomeLista: listaDeNomes[index],
                    onExcluir: () {
                      setState(() {
                        SimulaBD.excluirLista(listaDeNomes[index]);
                        listaDeNomes = SimulaBD.recuperarListas();
                      });
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novaListaCriada = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NovaListaView()),
          );

          if (novaListaCriada == true) {
            setState(() {
              listaDeNomes = SimulaBD.recuperarListas();
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
