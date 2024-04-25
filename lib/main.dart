import 'package:flutter/material.dart';
import 'park.dart';
import 'login.dart';
import 'login2.dart';
import 'home.dart';

void main() {
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
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

