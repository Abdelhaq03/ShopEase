import 'dart:developer';

import 'package:apptfg/auth/auth_service.dart';
import 'package:apptfg/auth/login_screen.dart';
import 'package:apptfg/home_screen.dart';
import 'package:apptfg/widgets/button.dart';
import 'package:apptfg/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = AuthService();

  final _name = TextEditingController();
  final _sname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _password2 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _sname.dispose();
    _email.dispose();
    _password.dispose();
    _password2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // Aquí puedes establecer el fondo, por ejemplo, una imagen de fondo
          image: DecorationImage(
            image: AssetImage('assets/icons/background.jpg'), // Cambia 'assets/background_image.jpg' por la ruta de tu imagen
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Spacer(),
              const Text("Crea tu Cuenta",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white)),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                hint: "Introduce tu nombre",
                label: "Nombre *",
                controller: _name,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Introduce tu apellidos",
                label: "Apellidos *",
                controller: _sname,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Introduce tu correo",
                label: "Correo electrónico *",
                controller: _email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Introduce tu contraseña",
                label: "Contraseña *",
                isPassword: true,
                controller: _password,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Introduce tu contraseña",
                label: "Repite Contraseña *",
                isPassword: true,
                controller: _password,
              ),
              const SizedBox(height: 30),
              CustomButton(
                label: "Crear Cuenta",
                onPressed: _signup,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Ya tienes una cuenta? ",
                    style: TextStyle(color: Colors.white), // Cambia el color del texto a blanco
                  ),
                  InkWell(
                    onTap: () => goToLogin(context),
                    child: const Text(
                      "Inicia sesión",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _signup() async {
    final user =
        await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if (user != null) {
      log("User Created Succesfully");
      goToHome(context);
    }
  }
}