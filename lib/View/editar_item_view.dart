import 'package:flutter/material.dart';
import 'package:lista_de_compras/Entidades/Item.dart';
import 'package:lista_de_compras/simula_bd.dart'; // Importe sua classe de entidade Item aqui

class EditarItemView extends StatefulWidget {
  final Item item;
  final String nomeLista;

  const EditarItemView(
      {super.key, required this.item, required this.nomeLista});

  @override
  _EditarItemViewState createState() => _EditarItemViewState();
}

class _EditarItemViewState extends State<EditarItemView> {
  final _formKey = GlobalKey<FormState>();

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
        title: const Text('Editar Item'),
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
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      Item novoItem = Item(
                        nome: nomeController.text,
                        quantidade: double.parse(quantidadeController.text),
                        unidadeDeMedida: unidadeController.text,
                        categoria: categoriaController.text,
                        notasAdicionais: notasController.text,
                        comprado: widget.item.comprado,
                      );

                      SimulaBD.editarItem(
                          widget.nomeLista, widget.item, novoItem);
                      Navigator.pop(context);
                    }
                    ;
                  });
                },
                child: const Text('Salvar Alterações'),
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
