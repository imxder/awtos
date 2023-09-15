import 'package:awtos/home/widgets/titulo.widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.blue,
      ),
      body: _body(),
    );
  }
  _body() {
    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(12),
        children: const [
          Titulo(),
        ]
      ),
    );
  }
}