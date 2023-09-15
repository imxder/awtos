import 'package:flutter/material.dart';

class NeighborhoodField extends StatelessWidget {
  const NeighborhoodField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            
            decoration: InputDecoration(
              hintText: 'Bairro:',
              enabled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 204, 218, 229),
                ),
              ),
            ),
          ),
        ), 
        SizedBox(width: 10), 
        Expanded(
          child: TextField(
            
            decoration: InputDecoration(
              hintText: 'Cidade:',
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