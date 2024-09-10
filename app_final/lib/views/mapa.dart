import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
   final FirebaseAuth _auth = FirebaseAuth.instance;

  sair() async {
    await _auth.signOut().then(
          (user) => Navigator.pushReplacementNamed(context, '/login'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: sair,
          child: const Text('Sair'),
        ),
      ),
    );
  }
}
