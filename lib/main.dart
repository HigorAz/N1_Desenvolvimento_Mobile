import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'park.dart';
import 'login.dart';
import 'login2.dart';
import 'home.dart';
import 'veiculos.dart';
import 'cadastro.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login', // Definindo a rota inicial como '/login'
      routes: {
        '/login': (context) => LoginPage(),
        '/login2': (context) => Login2Page(),
        '/home': (context) => HomePage(),
        '/park': (context) => ParkPage(),
        '/veiculos': (context) => VeiculosPage(),
        '/cadastro': (context) => CadastroPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

