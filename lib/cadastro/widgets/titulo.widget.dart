import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  const Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
    'AWTOS',
      
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 22,
        
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 2, 25, 45),
      ),
    );
  }
}