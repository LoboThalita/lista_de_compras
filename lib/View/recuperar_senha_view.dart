import 'package:flutter/material.dart';
import 'package:lista_de_compras/simula_bd.dart';

class RecuperarSenhaView extends StatefulWidget {
  const RecuperarSenhaView({super.key});

  @override
  _RecuperarSenhaViewState createState() => _RecuperarSenhaViewState();
}

class _RecuperarSenhaViewState extends State<RecuperarSenhaView> {
  final TextEditingController _emailController = TextEditingController();

  bool emailValido = false;
  String? senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Informe o email da conta para Recuperar a senha',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                senha = SimulaBD.recuperarSenha(_emailController.text);
                _enviarEmail(context);
              },
              child: const Text('Recuperar'),
            ),
          ],
        ),
      ),
    );
  }

  void _enviarEmail(BuildContext context) {
    SimulaBD.recuperarSenha(_emailController.text);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Recuperação de Senha'),
          content: Text(senha == null
              ? 'Email não encontrado no banco de dados'
              : 'Senha: $senha'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
