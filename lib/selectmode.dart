import 'package:awtos/widgets/selectButton.widget.dart';
import 'package:awtos/widgets/logo.widget.dart';
import 'package:flutter/material.dart';

class SelectMode extends StatefulWidget {
  const SelectMode({super.key});

  @override
  State<SelectMode> createState() => _SelectModeState();
}

class _SelectModeState extends State<SelectMode> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
             color: Colors.white,
            
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                children: const [
                  SizedBox(height: 100),
                  LogoSelectMode(), 
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50), 
                    child: SelectButton(),
                  ),
                  SizedBox(height: 17),     
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}