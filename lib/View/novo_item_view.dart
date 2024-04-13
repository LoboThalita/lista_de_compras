import 'package:flutter/material.dart';
import 'package:lista_de_compras/Entidades/Item.dart';
import 'package:lista_de_compras/simula_bd.dart'; // Importe sua classe de entidade Item aqui

class NovoItemView extends StatefulWidget {
  final String nomeLista;

  const NovoItemView({super.key, required this.nomeLista});
  @override
  _NovoItemViewState createState() => _NovoItemViewState();
}

class _NovoItemViewState extends State<NovoItemView> {
  late TextEditingController nomeController;
  late TextEditingController quantidadeController;
  late TextEditingController unidadeController;
  late TextEditingController categoriaController;
  late TextEditingController notasController;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController();
    quantidadeController = TextEditingController();
    unidadeController = TextEditingController();
    categoriaController = TextEditingController();
    notasController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: quantidadeController,
              decoration: const InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: unidadeController,
              decoration: const InputDecoration(labelText: 'Unidade de Medida'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: categoriaController,
              decoration: const InputDecoration(labelText: 'Categoria'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: notasController,
              decoration: const InputDecoration(labelText: 'Notas Adicionais'),
              maxLines: null,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Item novoItem = Item(
                  nome: nomeController.text,
                  quantidade: double.parse(quantidadeController.text),
                  unidadeDeMedida: unidadeController.text,
                  categoria: categoriaController.text,
                  notasAdicionais: notasController.text,
                  comprado: false,
                );
                SimulaBD.adicionarItem(widget.nomeLista, novoItem);
                Navigator.pop(
                    context);
              },
              child: Text('Adicionar Item'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpeza dos controladores de texto
    nomeController.dispose();
    quantidadeController.dispose();
    unidadeController.dispose();
    categoriaController.dispose();
    notasController.dispose();
    super.dispose();
  }
}
