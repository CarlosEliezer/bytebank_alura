import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/transferencias/lista.dart';

void main() => runApp(
  BytebankApp(),
);

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.grey[700],
        primaryColor: Colors.green[800],
        accentColor: Colors.blueAccent[600],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[600],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaTransferencias(),
    );
  }
}