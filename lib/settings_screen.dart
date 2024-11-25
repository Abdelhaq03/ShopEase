import 'package:apptfg/personal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:apptfg/auth/auth_service.dart';
import 'package:apptfg/auth/login_screen.dart';
import 'package:apptfg/widgets/button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: const Text(
                'Mi Cuenta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Signika Negative',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 35,
            right: 25,
            child: GestureDetector(
              onTap: () {
                // Lógica para ejecutar cuando se presione el botón del carrito
              },
              child: Container(
                width: 30,
                height: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/carrito_icon.png"),
                  ),
                ),
              ),
            ),
          ),
          // Rectángulo en la parte superior - Mis Tarjetas
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Container(
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Mis Tarjetas',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Signika Negative',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            // Lógica para ver todas las tarjetas
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Ver todas las tarjetas',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 13,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Rectángulo en la parte superior - Mis Compras en Mayo
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 170),
                Container(
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Mis Compras en Mayo',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Signika Negative',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            // Aquí puedes agregar la lógica para ver todas las tarjetas
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Ver todas las compras',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 13,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Rectángulo en la parte superior - Mis Productos y Listas
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 280),
                Container(
                  width: double.infinity,
                  height: 175,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Mis Productos y Listas',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Signika Negative',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildListItem(
                          imagePath: 'assets/icons/carrito_icon.png', 
                          text: 'Mis Productos',
                        ),
                        const SizedBox(height: 15),
                        _buildListItem(
                          imagePath: 'assets/icons/carrito_icon.png', 
                          text: 'Mis Pedidos',
                        ),
                        const SizedBox(height: 15),
                        _buildListItem(
                          imagePath: 'assets/icons/carrito_icon.png', 
                          text: 'Mis Listas',
                        ),
                      ],
                    ),
                  ),
                ),
                // Cuadrados en una fila
                SizedBox(height: 20), // Espaciado entre el rectángulo y los cuadrados
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Lógica a ejecutar cuando se hace clic en el primer cuadrado
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/support_icon.png', // Ruta de la imagen para el primer cuadrado
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Atención al Cliente',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PersonalDetailsScreen()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/avatar_icon.png', // Ruta de la imagen para el segundo cuadrado
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Datos Personales',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem({required String imagePath, required String text}) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 24,
          height: 24,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Signika Negative',
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 16,
        ),
      ],
    );
  }


  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}