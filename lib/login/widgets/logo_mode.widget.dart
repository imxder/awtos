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
      child: Image(
        image: AssetImage('assets/images/logocatolica.png'),
        width: 150,
        height: 150,
        color:  Color.fromARGB(255, 98, 0, 0),
      ),
    );
  }
}