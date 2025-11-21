import 'package:flutter/material.dart';
import 'cart_grid_page.dart';
import 'catr_summary_page.dart';

class CartHomePage extends StatelessWidget {
  const CartHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Lihat Produk"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartGridPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Ringkasan Keranjang"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartSummaryPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
