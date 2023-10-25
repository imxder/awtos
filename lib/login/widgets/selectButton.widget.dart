
import 'package:awtos/motorista/cadastro/cadastro.view.dart';
import 'package:awtos/passageiro/cadastro/cadastro.view.dart';
import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 2.5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CadastroPassageiroView()
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: const Color.fromARGB(255, 48, 53, 126),
            ).copyWith(
              minimumSize: MaterialStateProperty.all(const Size(0, 40)),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20.0)),
            ),
            child: const Text('PASSAGEIRO'),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 2.5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CadastroMotoristaView()
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: const Color.fromARGB(255, 98, 0, 0),
            ).copyWith(
              minimumSize: MaterialStateProperty.all(const Size(0, 40)),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20.0)),
            ),
            child: const Text('MOTORISTA'),
          ),
        ),
        const SizedBox(height: 260),
        const Text('Powered by AWTOS.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(1, 28, 105, 0.9),
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );  
  }
}