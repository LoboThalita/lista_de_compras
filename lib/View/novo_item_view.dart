import 'package:flutter/material.dart';
import 'package:lista_de_compras/Entidades/Item.dart';
import 'package:lista_de_compras/simula_bd.dart';

class NovoItemView extends StatefulWidget {
  final String nomeLista;

  const NovoItemView({super.key, required this.nomeLista});
  @override
  _NovoItemViewState createState() => _NovoItemViewState();
}

class _NovoItemViewState extends State<NovoItemView> {
  final _formKey = GlobalKey<FormState>();

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
        title: const Text('Novo Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: quantidadeController,
                decoration: const InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: unidadeController,
                decoration:
                    const InputDecoration(labelText: 'Unidade de Medida'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: categoriaController,
                decoration: const InputDecoration(labelText: 'Categoria'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: notasController,
                decoration:
                    const InputDecoration(labelText: 'Notas Adicionais'),
                maxLines: null,
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Item novoItem = Item(
                      nome: nomeController.text,
                      quantidade: double.parse(quantidadeController.text),
                      unidadeDeMedida: unidadeController.text,
                      categoria: categoriaController.text,
                      notasAdicionais: notasController.text,
                      comprado: false,
                    );
                    SimulaBD.adicionarItem(widget.nomeLista, novoItem);
                    Navigator.pop(context);
                  }
                },
                child: Text('Adicionar Item'),
              ),
            ],
          ),
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
