import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
       
        hintText: 'Senha',
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:  Colors.grey, // Cor da borda quando o campo não está selecionado
            width: 1.5, // Aumenta a largura da borda
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5, // Cor que você deseja quando o campo estiver selecionado
          ),
        ),
      ),
    );
  }
}