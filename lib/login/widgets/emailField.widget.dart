import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      
      decoration: InputDecoration(
        
        hintText: 'Email',
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