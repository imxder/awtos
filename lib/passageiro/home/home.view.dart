import 'dart:async';
import 'package:awtos/passageiro/cadastro/firestorep.dart';
import 'package:awtos/passageiro/chats/chat.view.dart';
import 'package:awtos/passageiro/menu/nav_bar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

    static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(-26.4669318, -49.1178001),
      zoom: 15.4746,
    );
  
  final TextEditingController textController = TextEditingController();
  
    void openBox({docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min, 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Digite o Novo Local de Saída:', 
           
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color:Color.fromARGB(255, 0, 44, 125),
              ),
            ),
            const SizedBox(height: 10),
             TextField(
              controller: textController,
              decoration: const InputDecoration(
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
                  color:Color.fromARGB(255, 0, 44, 125),
                ),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              FirestoreService().updatePassageiro(docID, textController.text);
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
              const  Color.fromARGB(255, 0, 44, 125),
              ),
            ),
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o ícone de voltar
        title: const Text(
          'AWTOS',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 44, 125),
        centerTitle: true,
       
      ),
      endDrawer: const NavBar(),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationButtonEnabled: false,
            compassEnabled: false,
            zoomControlsEnabled: false,
          ),
          Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white, // Cor de fundo do contêiner
            padding: const EdgeInsets.all(8),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirestoreService().getPassageirosStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List passageirosList = snapshot.data!.docs;
              
                    // Verifique se há pelo menos um documento na coleção
                    if (passageirosList.isNotEmpty) {
                      // Obtenha o endereço do registro mais recente
                      DocumentSnapshot lastDocument = passageirosList.first;
                      String docID = lastDocument.id;
                      Map<String, dynamic> data = lastDocument.data() as Map<String, dynamic>;
                      String addressText = data['address'];
              
                      return ListTile(
                        
                        title: Text(addressText,
                         
                          style: const TextStyle(
                            
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () => openBox(docID: docID),
                         
                        icon: const Icon(Icons.edit),
                        ),
                      );
                    } else {
                      return const Text('Nenhum registro encontrado.');
                    }
                  } else {
                    return const Text('Loading...');
                  }
                },
              ),
            ),     
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 0, 44, 125),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            const SizedBox(width: 50),
            const Text(
              'Procurar',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}