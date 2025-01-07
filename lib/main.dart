import 'package:bancodchina/ui/view/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const bancoDChina());
}

class bancoDChina extends StatelessWidget {
  const bancoDChina({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}