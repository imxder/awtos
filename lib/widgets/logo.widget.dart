import 'package:flutter/material.dart';

class LogoSelectMode extends StatefulWidget {
  const LogoSelectMode({super.key});

  @override
  State<LogoSelectMode> createState() => _LogoSelectModeState();
}

class _LogoSelectModeState extends State<LogoSelectMode> {
  @override
  Widget build(BuildContext context) {
    
    return const Center(
      child: Text(
        'AWTOS',
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 55,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 41, 123),
        ),
      ),
    );
  }
}