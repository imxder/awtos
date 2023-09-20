
import 'package:flutter/material.dart';

class DataNascimento extends StatelessWidget {
  const DataNascimento({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        
        Text(
          'Data de Nascimento:',
          style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 7, 25, 41), // Personalize a cor do texto conforme necessário
          ),
           // Centraliza o texto horizontalmente
         
        ),
        
        SizedBox(width: 34), 
        Expanded(
          child: TextField(
            
            keyboardType: TextInputType.number,
      
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'dd/mm/yyyy',
              enabled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 204, 218, 229),
                ),
              ),
            ),
          ),
        ), 
      ],
    );
  }
}