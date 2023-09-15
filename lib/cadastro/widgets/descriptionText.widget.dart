import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
    'Digite abaixo o número do seu registro acadêmico\nCatólica - SC, disponível no portal. (RA:XXXXXXXX) ',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13,
        color: Color.fromARGB(255, 7, 25, 41),
      ),
    );
  }
}