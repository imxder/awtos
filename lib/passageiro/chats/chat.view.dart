import 'package:awtos/motorista/cadastro/firestorem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Motoristas extends StatefulWidget {
  const Motoristas({Key? key}) : super(key: key);

  @override
  _MotoristasState createState() => _MotoristasState();
}

class _MotoristasState extends State<Motoristas> {
  final FirestoreServiceMotorista firestoreServiceMotorista = FirestoreServiceMotorista();
  Map<String, String> imageUrl = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    FirestoreServiceMotorista().getMotoristaStream().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        Map<String, String> motoristasData = {};

        for (QueryDocumentSnapshot document in snapshot.docs) {
          Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;
          if (data != null) {
            motoristasData[document.id] = data['image'] ?? '';
          }
        }
        
        if (mounted) {
          setState(() {
            imageUrl = motoristasData;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'MOTORISTAS',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 44, 125),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('motoristas')
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
              final motorista = snapshot.data!.docs[index];
              final nome = motorista['nome'];
              final address = motorista['address'];

              return Card(
                elevation: 4,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: imageUrl.containsKey(motorista.id) &&
                        imageUrl[motorista.id] != null &&
                        imageUrl[motorista.id]!.isNotEmpty
                        ? NetworkImage(imageUrl[motorista.id]!) as ImageProvider
                        : const AssetImage('assets/images/emptyprofile.png'),
                  ),
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
                  trailing: const Icon(Icons.chat, size: 35, color: Colors.green),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
