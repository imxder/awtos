import 'package:awtos/menu/NavBar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
      
      body: Column(
        children: [
          Container (
            color:  const Color.fromARGB(230, 243, 243, 242), // Cor da barra abaixo da AppBar
            height: 60, // Altura da barra abaixo da AppBar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back), // Ícone de voltar (seta para a esquerda)
                  color: const Color.fromRGBO(1, 28, 105, 0.9),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(width: 20),
                const Icon(
                  Icons.sms,
                  color: Color.fromRGBO(1, 28, 105, 0.9),
                ),
                const SizedBox(width: 10),

                const Expanded(
                  child: Text(
                    'Conversas',   
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(1, 28, 105, 0.9),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ), 
    );
  }
}