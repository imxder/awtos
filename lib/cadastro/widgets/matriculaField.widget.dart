import 'package:flutter/material.dart';

class MatriculaField extends StatelessWidget {
  const MatriculaField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        
        Text(
          'RA:',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 7, 25, 41), // Personalize a cor do texto conforme necessário
          ),
        ),
        
        SizedBox(width: 12), 
        Expanded(
          child: TextField(
            
            keyboardType: TextInputType.number,
            
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'xxxxxxxx',
              enabled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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