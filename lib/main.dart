import 'package:awtos/login/login.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp (const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AWTOS',
      theme: ThemeData(
        primaryColor : const Color.fromRGBO(1, 28, 105, 0.9),
      ),
      home: const LoginView(),
      
    );
    
  }
}
