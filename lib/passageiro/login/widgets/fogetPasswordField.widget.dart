import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatefulWidget {
  const ForgetPasswordButton({super.key});

  @override
  State<ForgetPasswordButton> createState() => _ForgetPasswordButtonState();
}

class _ForgetPasswordButtonState extends State<ForgetPasswordButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Coloque aqui a lógica para lidar com o "Esqueceu a senha?"
      },
      child: const Text(
        "Esqueceu a senha?",
        style: TextStyle(
          color: Color.fromARGB(255, 29, 81, 124), // Cor do texto do botão
          decoration: TextDecoration.none,  
        ),
      ),
    );
  }
}
