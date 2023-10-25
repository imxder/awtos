import 'dart:typed_data';
import 'package:awtos/login/login.view.dart';
import 'package:awtos/passageiro/cadastro/firestorep.dart';
import 'package:awtos/passageiro/menu/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PerfilPassageiro extends StatefulWidget {
  const PerfilPassageiro({Key? key});

  @override
  State<PerfilPassageiro> createState() => _PerfilPassageiroState();
}

class _PerfilPassageiroState extends State<PerfilPassageiro> {
  Uint8List? _image;
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController _novoNomeController = TextEditingController();
  final TextEditingController _novoEmailController = TextEditingController();
  final TextEditingController _novaSenhaController = TextEditingController();
  final TextEditingController _novoAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicialize os valores dos controladores e imagem, se necessário.
  }

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: const Color.fromARGB(255, 0, 44, 125),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/emptyprofile.png'),
                      ),
                Positioned(
                  bottom: -10,
                  left: 59,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            StreamBuilder<QuerySnapshot>(
              stream: firestoreService.getPassageirosStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<QueryDocumentSnapshot> passageirosList =
                      snapshot.data!.docs;

                  if (passageirosList.isNotEmpty) {
                    QueryDocumentSnapshot lastDocument = passageirosList.first;
                    Map<String, dynamic> data =
                        lastDocument.data() as Map<String, dynamic>;
                    String docID = lastDocument.id;

                    _novoNomeController.text = data['nome'];
                    _novoEmailController.text = data['email'];
                    _novaSenhaController.text = data['senha'];
                    _novoAddressController.text = data['address'];

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
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 44, 125), 
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
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 44, 125), 
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
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 44, 125), 
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
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 0, 44, 125), 
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

                            firestoreService.updatePassageiro2(docID, novoNome, novoEmail,
                            novaSenha, novoAddress)
                            .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Alterado com sucesso',textAlign: TextAlign.center,
                                  ),
                                  backgroundColor:  Color.fromARGB(255, 0, 44, 125),
                                ),
                              );   
                              setState(() {
                             
                              });
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 0, 44, 125),
                            ),
                          ),
                          child: const Text('Salvar Edições'),
                        ),
                        const SizedBox(height: 107),
                        TextButton(
                          onPressed: () {        
                            firestoreService.deletePassageiro(docID);
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
                              color: Color.fromARGB(255, 0, 44, 125), // Cor do texto
                              fontSize: 16, // Tamanho da fonte
                            ),
                          ),   
                        ),
                      ],
                    );
                  } else {
                    return const Text('Nenhum registro encontrado.');
                  }
                } else {
                  return const Text('Carregando...');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
