import 'package:awtos/motorista/login/widgets/fogetPasswordField.widget.dart';
import 'package:awtos/motorista/login/widgets/logo.widget.dart';
import 'package:awtos/motorista/login/widgets/passwordField.widget.dart';
import 'package:flutter/material.dart';
import 'package:awtos/motorista/login/widgets/emailField.widget.dart';
import 'package:awtos/motorista/login/widgets/loginButton.widget.dart';



class LoginMotoristaView extends StatefulWidget {
  const LoginMotoristaView({super.key});

  @override
  State<LoginMotoristaView> createState() => _LoginMotoristaViewState();
}

class _LoginMotoristaViewState extends State<LoginMotoristaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
    body: _body(),
    
    );
  }

  _body() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white,   Color.fromARGB(255, 98, 16, 8)],
                stops: [0.76,0.91], // Cores do degradê
              ),
            ),
          
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                children: const [
                  SizedBox(height: 110),
                  Logo(),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40), 
                    child: EmailField(),
                  ),
                  SizedBox(height: 17),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40), 
                    child: PasswordField(),
                  ),
                  SizedBox(height: 17),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40), 
                    child: LoginButton(),
                  ),
                  ForgetPasswordButton(),
                ],    
              ),
            ),
          ),
        ),
      ],   
    );
  }
} 