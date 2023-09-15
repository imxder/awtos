import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Center(
      child: Text(
        'AWTOS',
        style: TextStyle(
          fontSize: 55,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 14, 58, 97),
        ),
      ),
    );
  }
}