import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import '../config.dart';
import '../data/session.dart';
import '../widgets/left_drawer.dart';
import '../widgets/product_card.dart';
import '../models/product_entry.dart';
import 'product_detail.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  Future<List<Product>> fetchProducts(CookieRequest request) async {
    final response = await request.get(kProductsJsonUrl);
    final data = (response is List) ? response : <dynamic>[];

    final items = <Product>[];
    for (final d in data) {
      items.add(Product.fromJson(Map<String, dynamic>.from(d)));
    }

    // Filter milik user jika backend menyertakan owner_username
    final uname = Session.username;
    final hasOwner = items.any((e) => e.fields.ownerUsername != null);
    if (uname != null && hasOwner) {
      return items.where((e) => e.fields.ownerUsername == uname).toList();
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(title: const Text('All Products')),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<Product>>(
        future: fetchProducts(request),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = snap.data ?? const <Product>[];
          if (items.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text('There are no products yet.',
                    style: TextStyle(fontSize: 18, color: Color(0xff59A5D8))),
              ),
            );
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, i) => ProductCard(
              item: items[i],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductDetailPage(product: items[i])),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
