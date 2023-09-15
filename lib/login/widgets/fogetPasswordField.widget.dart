import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});


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
