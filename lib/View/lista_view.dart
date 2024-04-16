import 'package:flutter/material.dart';
import 'package:lista_de_compras/Componentes/item_comp.dart';
import 'package:lista_de_compras/Entidades/Item.dart';
import 'package:lista_de_compras/View/editar_item_view.dart';
import 'package:lista_de_compras/View/novo_item_view.dart';
import 'package:lista_de_compras/simula_bd.dart';

class ListaView extends StatefulWidget {
  String nomeLista;
  List<Item> itens;

  ListaView({
    super.key,
    required this.nomeLista,
    required this.itens,
  });

  @override
  _ListaViewState createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  late List<Item> itens;
  late TextEditingController pesquisaController;
  late TextEditingController novoNomeController;

  @override
  void initState() {
    super.initState();
    itens = widget.itens;
    pesquisaController = TextEditingController();
    novoNomeController = TextEditingController(text: widget.nomeLista);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(widget.nomeLista),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Editar Nome da Lista'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: novoNomeController,
                            decoration: const InputDecoration(
                              labelText: 'Novo Nome',
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancelar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            SimulaBD.editaNomeLista(
                              widget.nomeLista,
                              novoNomeController.text,
                            );
                            Navigator.pop(context);
                            setState(() {
                              widget.nomeLista = novoNomeController.text;
                            });
                          },
                          child: const Text('Salvar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
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
                    decoration: const InputDecoration(
                      hintText: 'Pesquisar itens...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      Item? resultado = SimulaBD.pesquisarItem(
                          widget.nomeLista, pesquisaController.text);
                      itens = resultado != null ? [resultado] : [];
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
                return ItemComp(
                  item: item,
                  nomeLista: widget.nomeLista,
                  onChecked: (checkedItem) {
                    setState(() {
                      SimulaBD.comprarItem(widget.nomeLista, checkedItem.nome);
                      itens = SimulaBD.recuperarItens(widget.nomeLista);
                    });
                  },
                  onEdit: (editedItem) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditarItemView(
                          item: editedItem,
                          nomeLista: widget.nomeLista,
                        ),
                      ),
                    ).then((value) {
                      setState(() {
                        itens = SimulaBD.recuperarItens(widget.nomeLista);
                      });
                    });
                  },
                  onDelete: (deletedItem) {
                    setState(() {
                      SimulaBD.excluirItem(widget.nomeLista, deletedItem.nome);
                      itens = SimulaBD.recuperarItens(widget.nomeLista);
                    });
                  },
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
