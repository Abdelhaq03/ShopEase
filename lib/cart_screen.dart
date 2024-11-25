import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    _cartItems = widget.cartItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;

    // Calcular el total del precio sumando el precio de cada producto en la cesta
    for (var item in _cartItems) {
      totalPrice += double.parse(item['productPrice']) * item['quantity'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cesta de Compra',
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Signika Negative',
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = _cartItems[index];
                  final productImageUrl = cartItem['productImageUrl'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: ListTile(
                        leading: productImageUrl != null
                            ? SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.network(
                                  productImageUrl,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const SizedBox.shrink(), // Si productImageUrl es nulo, no muestra nada
                        title: Text(
                          cartItem['productName'] ?? '', // Si productName es nulo, muestra una cadena vacía
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Signika Negative',
                          ),
                        ),
                        subtitle: Text(
                          'Cantidad: ${cartItem['quantity']}',
                          style: const TextStyle(
                            fontFamily: 'Signika Negative',
                            fontSize: 15,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                            ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Confirmar Eliminación"),
                                content: const Text("¿Estás seguro de que quieres eliminar este producto de la cesta?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("No"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Eliminar el producto de la cesta
                                      setState(() {
                                        _cartItems.removeAt(index);
                                      });
                                      // Cerrar el diálogo de confirmación
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Sí"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: ${totalPrice.toStringAsFixed(2)}€',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Signika Negative',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón de comprar
                      // Por ejemplo, procesar la compra y limpiar la cesta
                    },
                    child: const Text('Comprar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
