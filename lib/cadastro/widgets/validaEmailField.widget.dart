import 'package:flutter/material.dart';

class ValidaEmail extends StatelessWidget {
  const ValidaEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        
        hintText: 'Confirme seu Email:',
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