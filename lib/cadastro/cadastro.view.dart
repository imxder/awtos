import 'package:awtos/cadastro/widgets/descriptionText.widget.dart';
import 'package:awtos/cadastro/widgets/matriculaField.widget.dart';
import 'package:awtos/cadastro/widgets/neighborhoodField.widget.dart';
import 'package:awtos/cadastro/widgets/dataNascimento.widget.dart';
import 'package:awtos/cadastro/widgets/addressField.widget.dart';
import 'package:awtos/cadastro/widgets/nameField.widget.dart';
import 'package:awtos/cadastro/widgets/streetNameField.widget.dart';
import 'package:awtos/cadastro/widgets/titulo.widget.dart';
import 'package:awtos/cadastro/widgets/validaEmailField.widget.dart';
import 'package:awtos/cadastro/widgets/emailField.widget.dart';
import 'package:flutter/material.dart';

class CadastroView extends StatelessWidget {
  const CadastroView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Cadastro de Dados'),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 5, 50, 93),
    ),
    
    body: _body(),
    
    );
  }
  _body() {
    return Container (
      child: ListView(
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
        ],
      ),
    );
  }
}