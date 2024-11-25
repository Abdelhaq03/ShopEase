import 'package:flutter/material.dart';
import 'package:apptfg/services/firebase_service.dart';
import 'product_detail_screen.dart'; // Importa la pantalla de detalles del producto

class CategoryDetailScreen extends StatefulWidget {
  final String categoryName;
  final String categoryImage;
  final List<Map<String, dynamic>> cartItems; // Añade cartItems aquí

  const CategoryDetailScreen({
    Key? key,
    required this.categoryName,
    required this.categoryImage,
    required this.cartItems, // Añade cartItems al constructor
  }) : super(key: key);

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              widget.categoryImage,
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 8),
            Text(
              widget.categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: 'Signika Negative',
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: getProducts(category: widget.categoryName.toLowerCase()),
          builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.data!.isEmpty) {
              return const Center(child: Text('No hay productos disponibles'));
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dos columnas
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final productData = snapshot.data![index];
                  final productName = productData['nombre'];
                  final productDescription = productData['descripcion'];
                  final productPrice = productData['precio'].toString(); // Convertir a String
                  final productImageUrl = productData['url'];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            productName: productName,
                            productImageUrl: productImageUrl,
                            productDescription: productDescription,
                            productPrice: productPrice,
                            cartItems: widget.cartItems, // Pasa cartItems desde widget
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 200,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 100,
                                child: Image.network(
                                  productImageUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  productName,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Signika Negative',
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  productDescription,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontFamily: 'Signika Negative',
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '$productPrice€',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Signika Negative',
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
