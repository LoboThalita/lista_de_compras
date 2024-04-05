import 'package:flutter/material.dart';

class SobreView extends StatelessWidget{
  const SobreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o Projeto'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lista de compras',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'App desenvolvido para a matéria eletiva de Programação em Dispositivos Móveis, Ministrada pelo professor Rodrigo Plotz pela FATEC de Ribeirão Preto',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Desenvolvido por:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Thalita Helena Lobo fagundes da Paz',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}