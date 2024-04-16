import 'package:flutter/material.dart';
import 'package:lista_de_compras/View/central_view.dart';
import 'package:lista_de_compras/View/recuperar_senha_view.dart';
import 'package:lista_de_compras/View/sobre_view.dart';
import 'package:lista_de_compras/simula_bd.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  bool _emailValido = true;
  bool _senhaValida = true;
  bool _loginValido = true;

  void _login() {
    if (_emailController.text.isEmpty || _senhaController.text.isEmpty) {
      setState(() {
        _emailValido = _emailController.text.isNotEmpty;
        _senhaValida = _senhaController.text.isNotEmpty;
      });
      return;
    }

    if (SimulaBD.login(_emailController.text, _senhaController.text)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CentralView()),
      );
    } else {
      setState(() {
        _loginValido = false;
      });
    }
  }

  void _navegateSobre(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SobreView()),
    );
  }

  void _recuperarSenha() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RecuperarSenhaView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo a Lista de Compras'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin:  const EdgeInsets.only(bottom: 100),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://icones.pro/wp-content/uploads/2021/05/icone-de-panier-violet.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _emailValido ? null : 'Por favor informe o email',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  errorText: _senhaValida ? null : 'Por favor informe a senha',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.password),
                ),
              ),
            ),
            SizedBox(height: 40),
            if (!_loginValido)
              const Text(
                'Email ou senha incorretos',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _navegateSobre(context),
              child: Text('Sobre'),
            ),
            ElevatedButton(
              onPressed: _recuperarSenha,
              child: Text('Recuperar Senha'),
            ),
          ],
        ),
      ),
    );
  }
}
