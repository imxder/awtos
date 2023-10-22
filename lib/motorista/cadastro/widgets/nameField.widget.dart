import 'package:flutter/material.dart';

class NomeField extends StatelessWidget {
  const NomeField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(   
      decoration: InputDecoration(
      
        hintText: 'Nome Completo:',
        enabled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 219, 232, 244),
          ),
        ),
      ),
    );
  }
}