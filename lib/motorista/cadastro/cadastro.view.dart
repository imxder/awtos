import 'package:awtos/motorista/cadastro/firestorem.dart';
import 'package:awtos/motorista/range/range.view.dart';
import 'package:flutter/material.dart';

class CadastroMotoristaView extends StatefulWidget {
  const CadastroMotoristaView ({super.key});

  @override
  State<CadastroMotoristaView> createState() => _CadastroMotoristaViewState();
   
}
  class _CadastroMotoristaViewState extends State<CadastroMotoristaView> {

  final FirestoreServiceMotorista _firestoreService = FirestoreServiceMotorista();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Dados',
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
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
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
                color: Color.fromARGB(255, 0, 44, 125),
              ),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                hintText: 'Nome Completo',
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Senha',
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                hintText: 'Endereço',
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 44, 125),
                    width: 1.5,
                  ),
                ),
              ),
            ),
      
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                _firestoreService.addMotoristas(
                  _nomeController.text,
                  _emailController.text,
                  _senhaController.text,
                  _addressController.text,
                );
                _nomeController.clear();
                _emailController.clear();
                _senhaController.clear();
                _addressController.clear();
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
                backgroundColor: const Color.fromARGB(255, 0, 44, 125),
              ).copyWith(
                minimumSize: MaterialStateProperty.all(const Size(0, 40)),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                ),
              ),
              child: const Text('Criar Conta'),
            ),
            const SizedBox(height: 145),
            const Text(
              'Powered by AWTOS.',
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
