import 'package:awtos/motorista/menu/nav_bar.dart';
import 'package:flutter/material.dart';

class Passageiros extends StatefulWidget {
  const Passageiros({super.key});

  @override
  State<Passageiros> createState() => _PassageirosState();
}

class _PassageirosState extends State<Passageiros> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // O gesto foi um deslize para a direita
          Navigator.of(context).pop();
        }
      },

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'AWTOS',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ), 
          
          backgroundColor: const Color.fromARGB(255, 98, 16, 8),
        ),      
        endDrawer: const NavBarMotorista(),
                 
      ), 
    );
 
  }

}
  
