import 'package:apptfg/cart_screen.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productName;
  final String productImageUrl;
  final String productDescription;
  final String productPrice;
  final List<Map<String, dynamic>> cartItems; // Añade cartItems aquí

  const ProductDetailScreen({
    Key? key,
    required this.productName,
    required this.productImageUrl,
    required this.productDescription,
    required this.productPrice,
    required this.cartItems, // Añade cartItems al constructor
  }) : super(key: key);

  @override
  _ProductDetailScreenState createState() =>
      _ProductDetailScreenState(cartItems: cartItems);
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1; // Estado local para la cantidad
  List<Map<String, dynamic>> cartItems = []; // Lista de productos en la cesta

  _ProductDetailScreenState({required this.cartItems});

  // Método para agregar el producto a la cesta con la cantidad seleccionada
  void addToCart() {
    // Crear un objeto que represente el producto seleccionado con su cantidad
  Map<String, dynamic> product = {
    'productName': widget.productName,
    'productImageUrl': widget.productImageUrl,
    'productPrice': widget.productPrice,
    'quantity': _quantity,
  };
    // Añadir el producto a la lista de productos en la cesta
    cartItems.add(product);
    // Mostrar mensaje de confirmación
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Producto añadido a la cesta'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalles del Producto',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'Signika Negative',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Navegar a la pantalla de la cesta
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartScreen(cartItems: cartItems),
              ));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 90.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10), // Espacio entre el título y el container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 265, 
                      child: Image.network(
                        widget.productImageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.productName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Signika Negative',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.productDescription,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontFamily: 'Signika Negative',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 19),
                    Text(
                      '${widget.productPrice}€', // Convertir a String y añadir el signo de euro
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Signika Negative',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Espacio entre el container del producto y los botones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_quantity > 1) _quantity--; // No permite que la cantidad sea menor que 1
                      });
                    },
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '$_quantity', // Muestra la cantidad actual del producto
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Signika Negative',
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _quantity++; // Incrementa la cantidad
                      });
                    },
                    child: const Text('+'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0), // Añade espacio en la parte inferior del botón
              child: ElevatedButton(
                onPressed: addToCart, // Llamar al método para agregar el producto a la cesta
                child: const Text('Añadir a la cesta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
