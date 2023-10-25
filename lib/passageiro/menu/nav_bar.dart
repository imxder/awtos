import 'package:awtos/login/login.view.dart';
import 'package:awtos/passageiro/menu/editarPerfil.view.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color:  const Color.fromRGBO(1, 28, 105, 0.9), // Cor da barra
            height: 115, // Altura da barra
          ),
          SwitchListTile(
            title: const  Text('Dark Mode',
            textAlign: TextAlign.end),
            value: isDarkModeEnabled,
            onChanged: (value) {
              setState(() {
                isDarkModeEnabled = value;
                
              }); 
            },
            
            inactiveTrackColor: Colors.grey, 
            activeColor: const Color.fromRGBO(1, 28, 105, 0.9), // Cor da bola (thumb) quando o Dark Mode está ativado
           
          ),
          ListTile(
            leading: const Icon(Icons.person,
            color: Color.fromRGBO(1, 28, 105, 0.9)),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PerfilPassageiro()
                ),
              );
            },
          ),
          ListTile(
            leading:const Icon(Icons.attach_money,
            color: Color.fromRGBO(1, 28, 105, 0.9)),
            title: const  Text('Financeiro'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.drive_eta,
            color: Color.fromRGBO(1, 28, 105, 0.9)),
            title: const Text('Viagens Realizadas'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings,
            color: Color.fromRGBO(1, 28, 105, 0.9)),
            title: const Text('Configurações'),
            onTap: () {
              
            },
          ),
          const Spacer(), 
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
            },
            child: const Column(
              children: [
                Icon(Icons.logout, size: 25, color: Color.fromRGBO(1, 28, 105, 0.9)), // Ícone de logout
                Text('Log Out', style: TextStyle(color: Color.fromRGBO(1, 28, 105, 0.9))),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}