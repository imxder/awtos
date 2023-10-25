import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Passageiros extends StatefulWidget {
  const Passageiros({Key? key}) : super(key: key);

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
        stream: FirebaseFirestore.instance
            .collection('passageiros')
            .orderBy('timestamp', descending: false)
            .snapshots(),
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
              return  Card( 
                elevation: 4, 
                margin: const EdgeInsets.all(10), 
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: const Icon(Icons.person, size: 40, color: Color.fromRGBO(1, 28, 105, 0.9)), // Ícone personalizado
                  title: Text(nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    children: [
                      const Text(
                        'Embarque: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        address,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.chat, size: 35, color: Colors.green), // Ícone de chat personalizado
                ),
              );
            },
          );
        },
      ),       
    );    
  }
}
