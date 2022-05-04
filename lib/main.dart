import 'package:flutter/material.dart';

import 'auth_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
      },
      home: const AuthScreen(),
    );
  }
}
