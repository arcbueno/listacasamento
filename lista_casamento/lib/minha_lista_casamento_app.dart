import 'package:flutter/material.dart';
import 'package:lista_casamento/screens/home.screen/home.screen.dart';

class MinhaListaCasamentoApp extends StatelessWidget {
  const MinhaListaCasamentoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Casamento - Pedro e Rebeca',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
      color: Colors.red.shade500,
    );
  }
}
