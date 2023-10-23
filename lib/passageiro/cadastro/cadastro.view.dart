import 'package:awtos/passageiro/home/home.view.dart';
import 'package:flutter/material.dart';

class CadastroPassageiroView extends StatefulWidget {
  const CadastroPassageiroView ({super.key});

  @override
  State<CadastroPassageiroView> createState() => _CadastroPassageiroViewState();
}

class _CadastroPassageiroViewState extends State<CadastroPassageiroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
      
        title: const Text('Cadastro de Dados',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 44, 125),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color:  Color.fromRGBO(255, 255, 255, 1), 
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Padding (
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'AWTOS',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 44, 125),
              ),
            ),
            const SizedBox(height: 50),
            const TextField(
              decoration: InputDecoration(
       
              hintText: 'Nome Completo',
              enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromARGB(255, 0, 44, 125), // Cor da borda quando o campo não está selecionado
                    width: 1.5, // Aumenta a largura da borda
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromARGB(255, 0, 44, 125), 
                    width: 1.5,// Cor que você deseja quando o campo estiver selecionado
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
           
              hintText: 'Email',
              enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125), // Cor da borda quando o campo não está selecionado
                    width: 1.5, // Aumenta a largura da borda
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125),
                    width: 1.5, // Cor que você deseja quando o campo estiver selecionado
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
               
                hintText: 'Senha',
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromARGB(255, 0, 44, 125), // Cor da borda quando o campo não está selecionado
                    width: 1.5, // Aumenta a largura da borda
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125),
                    width: 1.5, // Cor que você deseja quando o campo estiver selecionado
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MapSample(),
                )
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor:const Color.fromARGB(255, 0, 44, 125),
            ).copyWith(
              minimumSize: MaterialStateProperty.all(const Size(0, 40)),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0)),
            ),
            child: const Text('Criar Conta'),
            ),
            const SizedBox(height: 225),
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
        ),
      ),
    ); 
  }
}