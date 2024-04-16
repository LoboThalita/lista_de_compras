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
