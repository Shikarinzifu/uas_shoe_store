import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: cart.cart.isEmpty
          ? const Center(
              child: Text("Cart is Empty"),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.cart.length,
                    itemBuilder: (context, index) {
                      final item = cart.cart[index];

                      return ListTile(
                        title: Text(item["name"]),
                        subtitle: Text(
                          "Rp ${item["price"]}",
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cart.removeItem(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Total: Rp ${cart.totalPrice}",
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Checkout"),
                ),
              ],
            ),
    );
  }
}