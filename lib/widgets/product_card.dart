import 'package:flutter/material.dart';
import '../models/product_entry.dart';

class ProductCard extends StatelessWidget {
  final Product item;      // envelope {model, pk, fields}
  final VoidCallback onTap;

  const ProductCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final f = item.fields;

    Widget thumb() {
      if (f.thumbnail == null || f.thumbnail!.isEmpty) {
        return Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(child: Icon(Icons.image)),
        );
      }
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          f.thumbnail!,
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 150,
            color: Colors.grey[300],
            child: const Center(child: Icon(Icons.broken_image)),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              thumb(),
              const SizedBox(height: 8),
              Text(f.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text('Category: ${f.category ?? "-"}'),
              const SizedBox(height: 4),
              Text('Price: Rp ${f.price}'),
              const SizedBox(height: 6),
              Text(
                f.description.length > 100 ? '${f.description.substring(0, 100)}...' : f.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black54),
              ),
              if (f.isFeatured) ...[
                const SizedBox(height: 6),
                const Text('Featured', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
              ],
            ]),
          ),
        ),
      ),
    );
  }
}
