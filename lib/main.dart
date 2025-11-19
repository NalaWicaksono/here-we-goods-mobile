import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'screens/login.dart';   
import 'package:provider/provider.dart';

void main() {
  runApp(const HereWeGoodsApp());
}

class HereWeGoodsApp extends StatelessWidget {
  const HereWeGoodsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<CookieRequest>(
      create: (_) => CookieRequest(),
      child: MaterialApp(
        title: 'Here We Goods - Football Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
