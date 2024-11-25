import 'package:cloud_firestore/cloud_firestore.dart';

/* Esta es la conexión hacia la base de datos de Firebase y realizamos consulta filtrando por categoría 
  
*/
FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getProducts({String? category}) async {
  List<Map<String, dynamic>> products = [];
  CollectionReference collectionReferenceProducts = db.collection('products');

  QuerySnapshot queryProduct;
  if (category != null) {
    queryProduct = await collectionReferenceProducts.where('categoria', isEqualTo: category).get();
  } else {
    queryProduct = await collectionReferenceProducts.get();
  }

  queryProduct.docs.forEach((documento) { 
    final data = documento.data();
    if (data is Map<dynamic, dynamic>) {
      products.add(data.cast<String, dynamic>());
    }
  });

  return products;
}
