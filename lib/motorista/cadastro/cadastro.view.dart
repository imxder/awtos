import 'package:awtos/motorista/range/range.view.dart';
import 'package:flutter/material.dart';

class CadastroMotoristaView extends StatefulWidget {
  const CadastroMotoristaView ({super.key});

  @override
  State<CadastroMotoristaView> createState() => _CadastroMotoristaViewState();
}

class _CadastroMotoristaViewState extends State<CadastroMotoristaView> {
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
        backgroundColor:const Color.fromARGB(255, 98, 16, 8),
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

      body:  Padding(
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
                color: Color.fromARGB(255, 98, 16, 8),
              ),
            ),
            const SizedBox(height: 50),
            const TextField(
              decoration: InputDecoration(
       
              hintText: 'Nome Completo',
              enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:  Color.fromARGB(255, 98, 16, 8), 
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 98, 16, 8), 
                    width: 1.5,
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
                    color:  Color.fromARGB(255, 98, 16, 8), 
                    width: 1.5, // Aumenta a largura da borda
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 98, 16, 8),
                    width: 1.5, 
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
                    color:  Color.fromARGB(255, 98, 16, 8), 
                    width: 1.5, 
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 98, 16, 8),
                    width: 1.5,  
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35), 
            ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MapRange(),
                )
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: const Color.fromARGB(255, 98, 0, 0),
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