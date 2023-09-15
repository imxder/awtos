import 'package:awtos/cadastro/cadastro.view.dart';
import 'package:awtos/home/home.view.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 0), // Espaço entre os botões (ajuste conforme necessário)
          child: Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CadastroView(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Ajuste o valor do raio conforme necessário
                ),
                backgroundColor: Colors.red, // Cor de fundo vermelha para o botão "CADASTRAR"
              ).copyWith(
                minimumSize: MaterialStateProperty.all(const Size(0, 40)), // Ajuste a altura do botão (40 é um exemplo)
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20.0)), // Ajuste o padding horizontal conforme necessário
              ),
              child: const Text('CADASTRO'),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 0), // Espaço entre os botões (ajuste conforme necessário)
          child: Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Ajuste o valor do raio conforme necessário
                ),
                backgroundColor: Colors.blue, // Cor de fundo azul para o botão "Logar"
              ).copyWith(
                minimumSize: MaterialStateProperty.all(const Size(0, 40)), // Ajuste a altura do botão (40 é um exemplo)
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 35.0)), // Ajuste o padding horizontal conforme necessário
              ),
              child: const Text('ENTRAR'),
            ),
          ),
        ),
      ],
    );
  }
}