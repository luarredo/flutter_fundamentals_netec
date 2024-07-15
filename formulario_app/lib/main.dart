import 'package:flutter/material.dart';
import 'package:formulario_app/registro_formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Formulario de Registro',
      home: RegistroFormulario(),
    );
  }
}
