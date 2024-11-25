import 'dart:developer';

import 'package:apptfg/auth/auth_service.dart';
import 'package:apptfg/auth/signup_screen.dart';
import 'package:apptfg/home_screen.dart';
import 'package:apptfg/widgets/button.dart';
import 'package:apptfg/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de la imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const Spacer(),
                const Text("Tu Cuenta",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white)),
                    Container(
                      alignment: Alignment.center, // Centra el contenido del contenedor
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0), // Ajusta este valor según lo necesites
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Accede o ",
                              style: TextStyle(color: Colors.white),
                            ),
                            InkWell(
                              onTap: () => goToSignup(context),
                              child: const Text(
                                "Crea tu cuenta",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                const SizedBox(height: 30),
                CustomTextField(
                  hint: "Introduce tu correo",
                  label: "Correo electrónico *",
                  controller: _email,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: "Introduce tu contraseña",
                  label: "Contraseña *",
                  controller: _password,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  label: "Login",
                  onPressed: _login,
                ),
                const SizedBox(height: 5),
                                    Container(
                      alignment: Alignment.center, // Centra el contenido del contenedor
                      child: Padding(
                        padding: const EdgeInsets.only(left: 115), // Ajusta este valor según lo necesites
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => goToSignup(context),
                              child: const Text(
                                "¿Has olvidado tu contraseña?",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                const Spacer()
              ],
            ),
          ),
        ],
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      goToHome(context);
    }
  }
}