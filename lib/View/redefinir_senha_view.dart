import 'package:flutter/material.dart';
import 'package:lista_de_compras/simula_bd.dart';

class RedefinirSenhaView extends StatefulWidget {
  const RedefinirSenhaView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RedefinirSenhaViewState createState() => _RedefinirSenhaViewState();
}

class _RedefinirSenhaViewState extends State<RedefinirSenhaView> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redefinir Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Informe o email da conta para redefinir a senha',
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
                _enviarEmail(context);
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  void _enviarEmail(BuildContext context) {
    SimulaBD.redefinirSenha(_emailController.text);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Email enviado'),
          content: Text(
              'Email de recuperação de senha enviado para ${_emailController.text}'),
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
