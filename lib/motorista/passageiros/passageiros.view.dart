import 'package:awtos/motorista/menu/nav_bar.dart';
import 'package:awtos/passageiro/chats/chat.view.dart';
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
          
          backgroundColor: Color.fromARGB(255, 98, 16, 8),
        ),      
        endDrawer: const NavBarMotorista(),
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
          color: const Color.fromARGB(255, 0, 0, 0), // Cor da barra abaixo da AppBar
          height: 150, // Altura da barra preta
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                  children: [
                    const Padding(padding: EdgeInsets.only(right: 1)),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 2, 123, 80),
                        ),
                        onPressed: () {
                          // Ação para recusar
                        },
                          child: const Text('OK',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 1)),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 44, 125),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ChatPage(),
                            ),
                          );
                        },
                        child: const Icon(
                        Icons.sms_outlined,
                      
                        size: 40,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 1)),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:const Color.fromARGB(255, 183, 1, -0),
                        ),
                        onPressed: () {
                          // Ação para aceitar
                        },
                        child: const Text('X',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),  
                        ),
                      ),
                    ),
                   const Padding(padding: EdgeInsets.only(left: 1)),
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