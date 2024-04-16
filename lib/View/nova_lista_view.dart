import 'package:flutter/material.dart';
import 'package:lista_de_compras/simula_bd.dart';

class NovaListaView extends StatefulWidget {
  const NovaListaView({super.key});

  @override
  _NovaListaViewState createState() => _NovaListaViewState();
}

class _NovaListaViewState extends State<NovaListaView> {
  final TextEditingController _nomeController = TextEditingController();

  void _criarLista() {
    String nomeLista = _nomeController.text;
    if (nomeLista.isNotEmpty) {
      SimulaBD.criarLista(nomeLista);
      Navigator.pop(context, true);
      setState(() {});
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Nome da lista vazio'),
            content: const Text('Por favor, insira um nome para a nova lista.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Lista'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome da Lista',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _criarLista,
              child: const Text('Criar Lista'),
            ),
          ],
        ),
      ),
    );
  }
}
