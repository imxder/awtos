import 'dart:typed_data';

import 'package:awtos/passageiro/menu/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PerfilPassageiro extends StatefulWidget {
  const PerfilPassageiro({super.key});

  @override
  State<PerfilPassageiro> createState() => _PerfilPassageiroState();
}

class _PerfilPassageiroState extends State<PerfilPassageiro> {
  
  Uint8List? _image;
   
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
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Stack(
              children: [
                _image != null ? 
                  CircleAvatar(
                    radius: 50,
                    
                    backgroundImage: MemoryImage(_image!),
                  )
                  :
                const CircleAvatar(
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
                )
              ],
            ),
            const SizedBox(height: 20),
            
            
          ],
        ),
      ),
    );
  }
}
