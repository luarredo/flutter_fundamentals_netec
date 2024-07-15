import 'package:calculadora_flutter/button.dart';
import 'package:flutter/material.dart';

class CalculadoraHomePage extends StatefulWidget {
  const CalculadoraHomePage({super.key});

  @override
  State<CalculadoraHomePage> createState() => _CalculadoraHomePageState();
}

class _CalculadoraHomePageState extends State<CalculadoraHomePage> {
  String _output = '0';
  String _operand = '';
  double _num1 = 0;
  double _num2 = 0;

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _operand = '';
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == 'x' ||
          buttonText == '/') {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _output = '0';
      } else if (buttonText == '.') {
        if (!_output.contains('.')) {
          _output += buttonText;
        }
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);
        if (_operand == '+') {
          _output = (_num1 + _num2).toString();
        }
        if (_operand == '-') {
          _output = (_num1 - _num2).toString();
        }
        if (_operand == 'x') {
          _output = (_num1 * _num2).toString();
        }
        if (_operand == '/') {
          _output = (_num1 / _num2).toString();
        }
        _num1 = 0;
        _num2 = 0;
        _operand = '';
      } else {
        _output == '0' ? _output = buttonText : _output += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Flutter'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12,
              ),
              child: Text(
                _output,
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Button(text: '7', buttonPressed: buttonPressed),
                  Button(text: '8', buttonPressed: buttonPressed),
                  Button(text: '9', buttonPressed: buttonPressed),
                  Button(text: '/', buttonPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  Button(text: '4', buttonPressed: buttonPressed),
                  Button(text: '5', buttonPressed: buttonPressed),
                  Button(text: '6', buttonPressed: buttonPressed),
                  Button(text: 'x', buttonPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  Button(text: '1', buttonPressed: buttonPressed),
                  Button(text: '2', buttonPressed: buttonPressed),
                  Button(text: '3', buttonPressed: buttonPressed),
                  Button(text: '-', buttonPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  Button(text: '.', buttonPressed: buttonPressed),
                  Button(text: '0', buttonPressed: buttonPressed),
                  Button(text: '+', buttonPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  Button(text: 'C', buttonPressed: buttonPressed),
                  Button(text: '=', buttonPressed: buttonPressed),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
