import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(   
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email:',
          enabled: true,
          border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 204, 218, 229),
          ),
        ),
      ),
    );
  }
}