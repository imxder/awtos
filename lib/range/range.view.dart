import 'package:awtos/menu/NavBar.dart';
import 'package:awtos/passageiros/passageiros.view.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRange extends StatefulWidget {
  const MapRange({super.key});

  @override
  State<MapRange> createState() => _MapRangeState();
}

class _MapRangeState extends State<MapRange> {
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
        
        backgroundColor: const Color.fromRGBO(1, 28, 105, 0.9),
      ),
      endDrawer: const NavBar(),
      
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(230, 243, 243, 242), // Cor da barra abaixo da AppBar
            height: 60, // Altura da barra abaixo da AppBar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back), // Ícone de voltar (seta para a esquerda)
                  color: const Color.fromRGBO(1, 28, 105, 0.9),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
               
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Centraliza os elementos no espaço disponível
                    children: [
                      Icon(
                        Icons.satellite_rounded,
                        color: Color.fromRGBO(1, 28, 105, 0.9),
                      ),
                      SizedBox(width: 10), // Ajuste o espaçamento conforme necessário
                      Text(
                        'Raio de Pesquisa',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(1, 28, 105, 0.9),
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
            child:GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
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
              'Confirmar',   
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
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