import 'package:flutter/material.dart';

class AddressField extends StatelessWidget {
  const AddressField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(   
      decoration: InputDecoration(
        hintText: 'Endereço:',
        enabled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color:Color.fromARGB(255, 14, 64, 6),
          ),
        ),
      ),
    );
  }
}