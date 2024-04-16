import 'package:flutter/material.dart';
import 'package:lista_de_compras/Entidades/Item.dart';
import 'package:lista_de_compras/simula_bd.dart'; // Importe sua classe de entidade Item aqui

class EditarItemView extends StatefulWidget {
  final Item item;
  final String nomeLista;

  EditarItemView({Key? key, required this.item, required this.nomeLista})
      : super(key: key);

  @override
  _EditarItemViewState createState() => _EditarItemViewState();
}

class _EditarItemViewState extends State<EditarItemView> {
  late TextEditingController nomeController;
  late TextEditingController quantidadeController;
  late TextEditingController unidadeController;
  late TextEditingController categoriaController;
  late TextEditingController notasController;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController(text: widget.item.nome);
    quantidadeController =
        TextEditingController(text: widget.item.quantidade.toString());
    unidadeController =
        TextEditingController(text: widget.item.unidadeDeMedida);
    categoriaController = TextEditingController(text: widget.item.categoria);
    notasController = TextEditingController(text: widget.item.notasAdicionais);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: quantidadeController,
              decoration: InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: unidadeController,
              decoration: InputDecoration(labelText: 'Unidade de Medida'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: categoriaController,
              decoration: InputDecoration(labelText: 'Categoria'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: notasController,
              decoration: InputDecoration(labelText: 'Notas Adicionais'),
              maxLines: null,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Item novoItem = Item(
                    nome: nomeController.text,
                    quantidade: double.parse(quantidadeController.text),
                    unidadeDeMedida: unidadeController.text,
                    categoria: categoriaController.text,
                    notasAdicionais: notasController.text,
                    comprado: widget.item.comprado,
                  );
                  SimulaBD.editarItem(widget.nomeLista, widget.item, novoItem);
                  Navigator.pop(context);
                });
              },
              child: Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    quantidadeController.dispose();
    unidadeController.dispose();
    categoriaController.dispose();
    notasController.dispose();
    super.dispose();
  }
}
