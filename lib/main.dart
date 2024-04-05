import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_compras/View/login_view.dart';

void main() {
  runApp(DevicePreview(
    enabled:true,
    builder: (context) => MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras App',
      home: LoginView(),
    );
  }
}
