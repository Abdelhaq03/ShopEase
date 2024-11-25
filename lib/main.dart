import 'dart:async';
import 'dart:io';


import 'package:apptfg/auth/login_screen.dart';
import 'package:apptfg/home_screen.dart';
import 'package:apptfg/prueba.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
   ? await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAom3G7xS_pJHEKt3V1YQdGoSUmxkZTBuU",
        authDomain: "apptfg-4788f.firebaseapp.com",
        messagingSenderId: "14916266053",
        projectId: "apptfg-4788f", 
        appId: "1:14916266053:android:426345f69c758b4dd49b2c",
      ),
    )
    : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
