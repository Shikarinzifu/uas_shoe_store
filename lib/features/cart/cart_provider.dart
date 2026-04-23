import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addItem(Map<String, dynamic> item) {
    cart.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    cart.removeAt(index);
    notifyListeners();
  }

  int get totalPrice {
    int total = 0;
    for (var item in cart) {
      total += item["price"] as int;
    }
    return total;
  }
}