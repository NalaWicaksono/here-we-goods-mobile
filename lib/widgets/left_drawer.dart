import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import '../config.dart';
import '../data/session.dart';
import '../screens/menu.dart';
import '../screens/product_list.dart';
import '../screens/create_product_form.dart';
import '../screens/login.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Here We Goods', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('Football Shop', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Products List'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProductsListPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Create Product'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CreateProductPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              final request = context.read<CookieRequest>();
              try { await request.logout(kLogoutUrl); } catch (_) {}
              Session.username = null;
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
