import 'dart:io';
import 'dart:ui';
import 'dart:core';

import 'package:awtos/login/login.view.dart';
import 'package:awtos/motorista/cadastro/firestorem.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PerfilMotorista extends StatefulWidget {
  const PerfilMotorista({Key? key}) : super(key: key);

  @override
  State<PerfilMotorista> createState() => _PerfilMotoristaState();
}


class _PerfilMotoristaState extends State<PerfilMotorista> {
  final FirestoreServiceMotorista firestoreServiceMotorista = FirestoreServiceMotorista();

  String imageUrl = '';
  final TextEditingController _novoNomeController = TextEditingController();
  final TextEditingController _novoEmailController = TextEditingController();
  final TextEditingController _novaSenhaController = TextEditingController();
  final TextEditingController _novoAddressController = TextEditingController();
  String docID = ''; // Defina a variável docID

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    firestoreServiceMotorista.getMotoristaStream().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        QueryDocumentSnapshot lastDocument = snapshot.docs.first;
        Map<String, dynamic>? data = lastDocument.data() as Map<String, dynamic>?;

        if (data != null) {
          docID = lastDocument.id; // Defina o docID aqui
          imageUrl = data['image'] ?? '';
          _novoNomeController.text = data['nome'];
          _novoEmailController.text = data['email'];
          _novaSenhaController.text = data['senha'];
          _novoAddressController.text = data['address'];
        }
        
          if (mounted) {
          setState(() {
            
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: const Color.fromARGB(255, 98, 16, 8),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            Stack(
              children: [
                imageUrl.isNotEmpty
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(imageUrl),
                      )
                    : const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/emptyprofile.png'),
                      ),
                Positioned(
                  bottom: -10,
                  left: 59,
                  child: IconButton(
                    onPressed: () async {
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

                      if (file == null) return;

                      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages = referenceRoot.child('images');
                      Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

                      try {
                        await referenceImageToUpload.putFile(File(file.path));
                        imageUrl = await referenceImageToUpload.getDownloadURL();
                        if (mounted) {
                          setState(() {
                            // Sua operação setState()
                          });
                        }
                      } catch (error) {
                        print(error);
                      }
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            StreamBuilder<QuerySnapshot>(
              stream: firestoreServiceMotorista.getMotoristaStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('Nenhum registro encontrado.'),
                  );
                }

                List<QueryDocumentSnapshot> motoristasList = snapshot.data!.docs;
                QueryDocumentSnapshot lastDocument = motoristasList.first;
                Map<String, dynamic> data = lastDocument.data() as Map<String, dynamic>;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          TextField(
                            controller: _novoNomeController,
                            decoration: const InputDecoration(
                              labelText: 'Nome Completo',
                              hintText: 'Nome Completo',
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 98, 16, 8),
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 98, 16, 8),
                                  width: 1.5,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 98, 16, 8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _novoEmailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Email',
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 98, 16, 8),
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 98, 16, 8),
                                  width: 1.5,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 98, 16, 8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _novaSenhaController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Senha',
                              hintText: 'Senha',
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 98, 16, 8),
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 98, 16, 8),
                                  width: 1.5,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 98, 16, 8),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _novoAddressController,
                            decoration: const InputDecoration(
                              labelText: 'Endereço',
                              hintText: 'Endereço',
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 98, 16, 8),
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 98, 16, 8),
                                  width: 1.5,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 98, 16, 8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        String novoNome = _novoNomeController.text;
                        String novoEmail = _novoEmailController.text;
                        String novaSenha = _novaSenhaController.text;
                        String novoAddress = _novoAddressController.text;

                        if (novoNome.isNotEmpty &&
                            novoEmail.isNotEmpty &&
                            novaSenha.isNotEmpty &&
                            novoAddress.isNotEmpty) {
                          firestoreServiceMotorista
                              .updateMotoristas2(docID, novoNome, novoEmail, novaSenha, novoAddress, imageUrl)
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Alterado com Sucesso',
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Color.fromARGB(255, 98, 16, 8),
                              ),
                            );
                           if (mounted) {
                                setState(() {
                                  // Sua operação setState()
                                });
                              }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Por favor, preencha todos os campos.',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Color.fromARGB(255, 98, 16, 8),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 98, 16, 8),
                        ),
                      ),
                      child: const Text('Salvar Edições'),
                    ),
                    const SizedBox(height: 107),
                    TextButton(
                      onPressed: () {
                        firestoreServiceMotorista.deleteMotorista(docID);
                        _novoNomeController.clear();
                        _novoEmailController.clear();
                        _novaSenhaController.clear();
                        _novoAddressController.clear();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: const Text(
                        'Deletar Conta',
                        style: TextStyle(
                          color: Color.fromARGB(255, 98, 16, 8),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}