import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Passageiros extends StatefulWidget {


  const Passageiros({Key? key,}) : super(key: key);

  @override
  _PassageirosState createState() => _PassageirosState();
}

class _PassageirosState extends State<Passageiros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'AWTOS',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 98, 16, 8),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('passageiros').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('Nenhum passageiro encontrado.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final passageiro = snapshot.data!.docs[index];
              final nome = passageiro['nome'];
              final address = passageiro['address'];

              return ListTile(
                title: Text(nome),
                subtitle: Text(address),
              );
            },
          );
        },
      ),
    );
  }
}


