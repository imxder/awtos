import 'package:awtos/passageiro/cadastro/widgets/descriptionText.widget.dart';
import 'package:awtos/passageiro/cadastro/widgets/matriculaField.widget.dart';
import 'package:awtos/passageiro/cadastro/widgets/neighborhoodField.widget.dart';
import 'package:awtos/passageiro/cadastro/widgets/dataNascimento.widget.dart';
import 'package:awtos/passageiro/cadastro/widgets/addressField.widget.dart';
import 'package:awtos/passageiro/cadastro/widgets/nameField.widget.dart';
import 'package:awtos/passageiro/cadastro/widgets/streetNameField.widget.dart';
import 'package:awtos/passageiro/cadastro/widgets/termos.widget.dart';
import 'package:awtos/passageiro/cadastro/widgets/titulo.widget.dart';
import 'package:awtos/passageiro/cadastro/widgets/validaEmailField.widget.dart';
import 'package:awtos/passageiro/cadastro/widgets/emailField.widget.dart';
import 'package:awtos/passageiro/login/login.view.dart';
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
            color: Color.fromRGBO(1, 28, 105, 0.9),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color:  Color.fromRGBO(1, 28, 105, 0.9), 
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
  
      body: _body(),
      
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 0, 44, 125),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end, // Centraliza os elementos horizontalmente
          children: [
            const Spacer(),
            const SizedBox(width: 50),
            const Text(
              'Confirmar',   
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_forward_outlined),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPassageiroView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      
    );
  }

  _body() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(12),
      children: const [
        Titulo(),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15), 
          child: NomeField(),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15), 
          child: EmailField(),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15), 
          child: ValidaEmail(),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.fromLTRB(35, 0, 15, 15),
          child: DataNascimento(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15), 
          child: AddressField(),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15), 
          child: NeighborhoodField(),
        ),
         SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 40, 15), 
          child: StreetNameField(),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15), 
          child: DescriptionText(),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 50, 15), 
          child: MatriculaField(),
        ),
        TermosCheck(),
      ],
      
    );
    
  }
}