import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final VoidCallback? onRemove;

  const ProductCart({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(name),
        subtitle: Text('৳ $price × $quantity'),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
