import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    
    return const Center(
      child: Text(
        'AWTOS',
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 65,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 41, 123),
        ),
      ),
    );
  }
}