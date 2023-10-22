import 'package:flutter/material.dart';

class StreetNameField extends StatelessWidget {
  const StreetNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'CEP:',
              enabled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 204, 218, 229),
                ),
              ),
            ),
          ),
        ), 
        SizedBox(width: 20), 
        Expanded(
          flex: 1,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
    
              hintText: 'Nº:',
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