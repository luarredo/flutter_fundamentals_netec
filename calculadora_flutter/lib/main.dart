import 'package:calculadora_flutter/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculadoraHomePage()
    );
  }
}