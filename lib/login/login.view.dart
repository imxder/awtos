import 'package:awtos/login/widgets/fogetPasswordField.widget.dart';
import 'package:awtos/login/widgets/logo.widget.dart';
import 'package:flutter/material.dart';
import 'package:awtos/login/widgets/emailField.widget.dart';
import 'package:awtos/login/widgets/loginButton.widget.dart';
import 'package:awtos/login/widgets/passwordField.widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return GestureDetector(
      onTap: null, // Desativar a ação de toque
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 0, 44, 125)],
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
              SizedBox(height: 17),
              ForgetPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }
}
