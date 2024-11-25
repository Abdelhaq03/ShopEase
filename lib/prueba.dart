import 'package:apptfg/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Prueba extends StatefulWidget {
  const Prueba({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: ((context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                // Aquí puedes acceder a los datos de la lista
                final productName = snapshot.data?[index]['nombre'] ?? 'Nombre no disponible';
                return Text(productName);
              },
            );
          }
        }),
      ),
    );
  }
}
