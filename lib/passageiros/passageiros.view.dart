import 'package:awtos/menu/NavBar.dart';
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
          
          backgroundColor: const Color.fromRGBO(1, 28, 105, 0.9),
        ),      
        endDrawer: const NavBar(),
        body: _body(),         
      ), 
    );
 
  }

  _body(){

    return Column(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/passageiro.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Color.fromARGB(255, 0, 0, 0), // Cor da barra abaixo da AppBar
          height: 150, // Altura da barra preta
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                  children: [
                    SizedBox(
                      width: 90,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 183, 1, -0),
                        ),
                        onPressed: () {
                          // Ação para recusar
                        },
                        child: const Text('Recusar'),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 44, 125),
                        ),
                        onPressed: () {
                          // Ação para chat
                        },
                        child: const Text('Chat'),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:const Color.fromARGB(255, 2, 123, 80),
                        ),
                        onPressed: () {
                          // Ação para aceitar
                        },
                        child: const Text('Aceitar'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  } 
}