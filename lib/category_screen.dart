import 'package:flutter/material.dart';
import 'package:apptfg/category_detail_screen.dart';
import 'package:apptfg/auth/auth_service.dart';
import 'package:apptfg/auth/login_screen.dart';
import 'package:apptfg/widgets/button.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 5.0),
                child: Text(
                  'Categorías',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Signika Negative',
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: categorias.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(
                        categorias[index].imagen,
                        width: 30,
                        height: 30,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categorias[index].nombre,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryDetailScreen(
                              categoryName: categorias[index].nombre,
                              categoryImage: categorias[index].imagen, cartItems: [],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}

class Categoria {
  final String nombre;
  final String imagen;

  Categoria({required this.nombre, required this.imagen});
}

final List<Categoria> categorias = [
  Categoria(nombre: 'Agua y Refrescos', imagen: "assets/category_icons/agua.png"),
  Categoria(nombre: 'Aperitivos', imagen: "assets/category_icons/aperitivos.png"),
  Categoria(nombre: 'Bodega', imagen: "assets/category_icons/bodega.png"),
  Categoria(nombre: 'Carne', imagen: "assets/category_icons/carne.png"),
  Categoria(nombre: 'Cereales y Galletas', imagen: "assets/category_icons/galleta.png"),
  Categoria(nombre: 'Frutas y Verduras', imagen: "assets/category_icons/frutas.png"),
  Categoria(nombre: 'Huevos, Leche y Mantequilla', imagen: "assets/category_icons/leche.png"),
  Categoria(nombre: 'Panadería y Pastelería', imagen: "assets/category_icons/pan.png"),
  Categoria(nombre: 'Pizzas y Platos Preparados', imagen: "assets/category_icons/pizza.png"),
  Categoria(nombre: 'Zumos', imagen: "assets/category_icons/zumo.png"),
];
