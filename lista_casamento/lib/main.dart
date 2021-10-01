import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:lista_casamento/minha_lista_casamento_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MinhaListaCasamentoApp();
        }

        return CircularProgressIndicator();
      },
    );
  }
}
