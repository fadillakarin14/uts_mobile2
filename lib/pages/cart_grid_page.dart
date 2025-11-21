import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_cubit.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class CartGridPage extends StatelessWidget {
  const CartGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(id: 1, name: "Produk A", price: 10000),
      Product(id: 2, name: "Produk B", price: 15000),
      Product(id: 3, name: "Produk C", price: 20000),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Produk")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
            onAdd: () {
              context.read<CartCubit>().addProduct(products[index]);
            },
          );
        },
      ),
    );
  }
}
