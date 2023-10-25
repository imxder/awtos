import 'package:awtos/motorista/cadastro/firestorem.dart';
import 'package:awtos/motorista/passageiros/passageiros.view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awtos/motorista/menu/nav_bar.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MapRange extends StatefulWidget {
  const MapRange({Key? key}) : super(key: key);

  @override
  State<MapRange> createState() => _MapRangeState();
}

class _MapRangeState extends State<MapRange> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-26.4796672, -49.0877181),
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
              color: Color.fromARGB(255, 98, 16, 8),
            ),
          ),
          const SizedBox(height: 10),
           TextField(
            controller: textController,
            decoration: const InputDecoration(
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
      actions: [
        ElevatedButton(
          onPressed: () {
            FirestoreServiceMotorista().updateMotorista(docID, textController.text);
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 98, 16, 8),
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
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'AWTOS',
            style:  TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 98, 16, 8),
      ),
      endDrawer: const NavBarMotorista(),

      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(230, 243, 243, 242),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: const Color.fromARGB(255, 98, 16, 8),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.satellite_rounded,
                        color:  Color.fromARGB(255, 98, 16, 8),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Raio de Pesquisa',
                        style: TextStyle(
                          fontSize: 20,
                          color:  Color.fromARGB(255, 98, 16, 8),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
          Expanded(
            child: Stack(
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
                    height: 70,
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirestoreServiceMotorista().getMotoristaStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List motoristasList = snapshot.data!.docs;
                          if (motoristasList.isNotEmpty) {
                            DocumentSnapshot lastDocument = motoristasList.first;
                            Map<String, dynamic> data = lastDocument.data() as Map<String, dynamic>;
                            String docID = lastDocument.id;
                            String addressText = data['address'];

                            return ListTile(
                              title: Text(
                                addressText,
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
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 98, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           const Spacer(),
            const SizedBox(width: 50),
            const Text(
              'Local de Saída',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Passageiros(),
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
