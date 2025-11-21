import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_cubit.dart';

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ringkasan Keranjang")),
      body: BlocBuilder<CartCubit, List<dynamic>>(
        builder: (context, cart) {
          if (cart.isEmpty) {
            return const Center(child: Text("Keranjang kosong"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text("Rp ${item.price}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () =>
                                context.read<CartCubit>().decreaseQty(item.id),
                          ),
                          Text(item.quantity.toString()),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () =>
                                context.read<CartCubit>().increaseQty(item.id),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<CartCubit, List<dynamic>>(
                  builder: (context, state) {
                    final cubit = context.read<CartCubit>();
                    return Column(
                      children: [
                        Text("Total Item : ${cubit.totalItems}"),
                        Text("Total Harga : Rp ${cubit.totalPrice}"),
                      ],
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
