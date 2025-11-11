import 'package:flutter/material.dart';
import 'create_product_form.dart';
import '../widgets/left_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Here We Goods • Football Shop'),
        centerTitle: true,
      ),
      drawer: const LeftDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 520;

          final buttons = [
            _MenuButton(
              color: Colors.blue,
              icon: Icons.list_alt,
              label: 'All Products',
              onPressed: () =>
                  _showSnackBar(context, 'Kamu telah menekan tombol All Products'),
            ),
            _MenuButton(
              color: Colors.green,
              icon: Icons.inventory_2,
              label: 'My Products',
              onPressed: () =>
                  _showSnackBar(context, 'Kamu telah menekan tombol My Products'),
            ),
            _MenuButton(
              color: Colors.red,
              icon: Icons.add_circle_outline,
              label: 'Create Product',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreateProductPage()),
                );
              },
            ),
          ];

          if (isWide) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: buttons,
                ),
              ),
            );
          } else {
            return ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const SizedBox(height: 12),
                ...buttons.expand((b) => [b, const SizedBox(height: 16)]),
              ],
            );
          }
        },
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _MenuButton({
    required this.color,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(color),
          foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          elevation: const MaterialStatePropertyAll<double>(2),
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 28),
        label: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
