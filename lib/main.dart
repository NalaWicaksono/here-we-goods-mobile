import 'package:flutter/material.dart';
import 'screens/menu.dart';

void main() {
  runApp(const HereWeGoodsApp());
}

class HereWeGoodsApp extends StatelessWidget {
  const HereWeGoodsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Here We Goods - Football Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
