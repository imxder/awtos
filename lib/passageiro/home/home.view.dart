import 'dart:async';
import 'package:awtos/passageiro/chats/chat.view.dart';
import 'package:awtos/passageiro/menu/nav_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o ícone de voltar  
        title: const Text('AWTOS',   
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

      body: Column(
        children: [
          
          Expanded(
            child:GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationButtonEnabled: false,  
              compassEnabled: false, 
              zoomControlsEnabled: false,   
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 0, 44, 125),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end, // Centraliza os elementos horizontalmente
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