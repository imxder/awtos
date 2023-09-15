import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  const Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'AWTOS',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 2, 25, 45),
      ),);
  }
}