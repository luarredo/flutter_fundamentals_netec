import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/constants.dart';
import 'package:login_app/post_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inicio de sesión")),
      body: Column(
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(labelText: 'Usuario'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () async {
              if (_passwordController.text == mockPassword) {
                await storage.write(key: 'auth_token', value: mockToken);
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PostsPage(),
                ));
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Contraseña incorrecta'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: const Text('Iniciar sesión'),
          ),
        ],
      ),
    );
  }
}
