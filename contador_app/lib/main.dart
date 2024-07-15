import 'package:contador_app/contador_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(
        child: ContadorApp(),
      ),
    );

class ContadorApp extends StatelessWidget {
  const ContadorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contador App',
      home: ContadorPage(),
    );
  }
}
