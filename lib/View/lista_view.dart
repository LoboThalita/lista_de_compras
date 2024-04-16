import 'package:flutter/material.dart';
import 'package:lista_de_compras/Entidades/Item.dart';
import 'package:lista_de_compras/View/editar_item_view.dart';
import 'package:lista_de_compras/View/novo_item_view.dart';
import 'package:lista_de_compras/simula_bd.dart';

class ListaView extends StatefulWidget {
  String nomeLista;
  List<Item> itens;

  ListaView({
    Key? key,
    required this.nomeLista,
    required this.itens,
  }) : super(key: key);

  @override
  _ListaViewState createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  late List<Item> itens;
  late TextEditingController pesquisaController;

  @override
  void initState() {
    super.initState();
    itens = widget.itens;
    pesquisaController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nomeLista),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pesquisaController,
                    decoration: InputDecoration(
                      hintText: 'Pesquisar itens...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      itens = [SimulaBD.pesquisarItem(widget.nomeLista, pesquisaController.text)];
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index) {
                final item = itens[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: item.comprado,
                        onChanged: (value) {
                          setState(() {
                            SimulaBD.comprarItem(widget.nomeLista, item.nome);
                            itens = SimulaBD.recuperarItens(widget.nomeLista);
                          });
                        },
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(item.nome),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Quantidade: ${item.quantidade} ${item.unidadeDeMedida}'),
                              Text('Categoria: ${item.categoria}'),
                              Text('Notas Adicionais: ${item.notasAdicionais}'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditarItemView(
                                        item: item,
                                        nomeLista: widget.nomeLista,
                                      ),
                                    ),
                                  ).then((value) {
                                    setState(() {
                                      itens = SimulaBD.recuperarItens(
                                          widget.nomeLista);
                                    });
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete,
                                    color: Color.fromARGB(255, 191, 21, 21)),
                                onPressed: () {
                                  setState(() {
                                    SimulaBD.excluirItem(
                                        widget.nomeLista, item.nome);
                                    itens = SimulaBD.recuperarItens(
                                        widget.nomeLista);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NovoItemView(nomeLista: widget.nomeLista)),
          );
          setState(() {
            itens = SimulaBD.recuperarItens(widget.nomeLista);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
