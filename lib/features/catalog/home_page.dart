import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../cart/cart_provider.dart';
import '../cart/cart_page.dart';
import '../auth/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> shoes = const [
    {"name": "Nike Air Max", "price": 1500000},
    {"name": "Adidas Samba", "price": 1800000},
    {"name": "Vans Old Skool", "price": 950000},
    {"name": "Converse Chuck Taylor", "price": 850000},
    {"name": "Puma Suede", "price": 1200000},
  ];

  Future logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shoe Store"),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const CartPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () =>
                logout(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          final item = shoes[index];

          return Card(
            margin:
                const EdgeInsets.all(10),
            child: ListTile(
              title: Text(item["name"]),
              subtitle: Text(
                "Rp ${item["price"]}",
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).addItem(item);

                  ScaffoldMessenger.of(
                          context)
                      .showSnackBar(
                    SnackBar(
                      content: Text(
                        "${item["name"]} added",
                      ),
                    ),
                  );
                },
                child: const Text("Buy"),
              ),
            ),
          );
        },
      ),
    );
  }
}