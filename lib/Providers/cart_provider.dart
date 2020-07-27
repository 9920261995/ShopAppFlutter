import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  int quantity;
  CartItem(
      {@required this.id,
      @required this.title,
      @required this.price,
      this.quantity});
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get cartItemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0;
    _items.forEach((key, cartItem) {
      total = total + cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addProduct(String id, String title, double price) {
    if (_items.containsKey(id)) {
      //Change quantity
      _items.update(
          id,
          (existing) => CartItem(
              id: existing.id,
              title: existing.title,
              price: existing.price,
              quantity: existing.quantity + 1));
    } else {
      // _items.putIfAbsent(id) () => CartItem(id:DateTime.now().toString(),title: title,price: price);
      _items.putIfAbsent(
          id,
          () => CartItem(
              id: Random().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }
}
