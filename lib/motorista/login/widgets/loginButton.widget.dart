import 'package:awtos/motorista/cadastro/cadastro.view.dart';
import 'package:awtos/motorista/range/range.view.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 2.5),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CadastroMotoristaView(),
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
              child: const Text('CADASTRO'),
            ),
          ),
        ),
        
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 2.5),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MapRange(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor:const Color.fromARGB(255, 98, 0, 0),
              ).copyWith(
                minimumSize: MaterialStateProperty.all(const Size(0, 40)),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20.0)),
              ),
              child: const Text('ENTRAR'),
            ),
          ),
        ),
      ],
    );    
  }
}