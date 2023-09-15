import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Senha',
        hintText: 'Senha',
        enabled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}