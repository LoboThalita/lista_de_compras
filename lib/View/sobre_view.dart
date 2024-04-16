import 'package:flutter/material.dart';
import 'package:lista_de_compras/simula_bd.dart';

class SobreView extends StatelessWidget {
  const SobreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o Projeto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lista de compras',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'App desenvolvido para a matéria eletiva de Programação em Dispositivos Móveis, Ministrada pelo professor Rodrigo Plotz pela FATEC de Ribeirão Preto',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              'Login:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Email: ${SimulaBD.email}'),
            Text('Senha: ${SimulaBD.senha}'),
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
