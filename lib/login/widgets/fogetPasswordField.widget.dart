import 'package:awtos/login/selectmode.dart';
import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatefulWidget {
  const ForgetPasswordButton({super.key});

  @override
  State<ForgetPasswordButton> createState() => _ForgetPasswordButtonState();
}

class _ForgetPasswordButtonState extends State<ForgetPasswordButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            // Coloque aqui a lógica para lidar com o "Esqueceu a senha?"
          },
          child: const Text(
            "Esqueceu a senha?",
            style: TextStyle(
              color: Color.fromARGB(255, 29, 81, 124), // Cor do texto
              decoration: TextDecoration.none,
            ),
          ),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SelectMode(),
              ),
            );
            // Coloque aqui a lógica para lidar com o "Esqueceu a senha?"
          },
          child: const Text(
            "Criar Conta",
            style: TextStyle(
              color: Color.fromARGB(255, 29, 81, 124), // Cor do texto
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}