import 'package:flutter/material.dart';
import 'package:lista_de_compras/View/sobre_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  void _login() {
    // Lógica de login aqui
  }

 void _navegateSobre(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SobreView()),
  );
}

  void _redefinirSenha() {
    // Lógica para redefinir a senha
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
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100], 
                borderRadius: BorderRadius.circular(10),
              ),
              child:TextField(
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: 'Senha',
                contentPadding: EdgeInsets.all(10), 
                  border: InputBorder.none,
              ),
            ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed:() => _navegateSobre(context),
              child: Text('Sobre'),
            ),
            ElevatedButton(
              onPressed: _redefinirSenha,
              child: Text('Redefinir Senha'),
            ),
          ],
        ),
        color: Colors.grey[100],
      ),
    );
  }
}
