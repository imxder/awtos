import 'dart:typed_data';
import 'package:awtos/login/login.view.dart';
import 'package:awtos/motorista/cadastro/firestorem.dart';
import 'package:awtos/passageiro/menu/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PerfilMotorista extends StatefulWidget {
  const PerfilMotorista({Key? key});

  @override
  State<PerfilMotorista> createState() => _PerfilMotoristaState();
}

class _PerfilMotoristaState extends State<PerfilMotorista> {
  Uint8List? _image;
  final FirestoreServiceMotorista firestoreServiceMotorista = FirestoreServiceMotorista();
  final TextEditingController _novoNomeController = TextEditingController();
  final TextEditingController _novoEmailController = TextEditingController();
  final TextEditingController _novaSenhaController = TextEditingController();
  final TextEditingController _novoAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
        backgroundColor: const Color.fromARGB(255, 98, 16, 8),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
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
                        backgroundImage: AssetImage('assets/images/emptyprofile.png'),
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
              stream: firestoreServiceMotorista.getMotoristaStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading message when data is loading
                  return const Center(
                    child: CircularProgressIndicator(), // You can customize this loading indicator
                  );
                } else if (snapshot.hasError) {
                  // Handle error
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  // Show "Nenhum registro encontrado." when there's no data
                  
                  return const Center(
                    
                    child:  Text('Nenhum registro encontrado.'),
                  );
                }

                List<QueryDocumentSnapshot> motoristasList = snapshot.data!.docs;
                QueryDocumentSnapshot lastDocument = motoristasList.first;
                Map<String, dynamic> data = lastDocument.data() as Map<String, dynamic>;
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

                        firestoreServiceMotorista.updateMotoristas2(docID, novoNome, novoEmail, novaSenha, novoAddress)
                            .then((_) {
                              setState(() {
                                // Handle update success
                              });
                            });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 98, 16, 8),
                        ),
                      ),
                      child: const Text('Salvar Edições'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        firestoreServiceMotorista.deleteMotorista(docID);
                          _novoNomeController.clear();
                          _novoEmailController.clear();
                          _novaSenhaController.clear();
                          _novoAddressController.clear();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: const Text('Deletar Conta'),
                    ),
                    const SizedBox(height: 50.0),
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
