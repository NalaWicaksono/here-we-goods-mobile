import 'package:flutter/material.dart';
import '../models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final f = product.fields;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (f.thumbnail != null && f.thumbnail!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                f.thumbnail!,
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 180,
                  color: scheme.primary.withOpacity(.1),
                  child: Icon(Icons.image, color: scheme.primary),
                ),
              ),
            ),
          const SizedBox(height: 16),
          Text(f.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Text('Price: Rp ${f.price}'),
          Text('Category: ${f.category ?? "-"}'),
          Text('Featured: ${f.isFeatured ? "Ya" : "Tidak"}'),
          if (f.ownerUsername != null) Text('Owner: ${f.ownerUsername}'),
          const SizedBox(height: 16),
          const Text('Description', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Text(f.description),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.center,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali ke daftar'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
