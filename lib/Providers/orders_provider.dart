import 'package:flutter/foundation.dart';
import 'package:shop_app/Providers/cart_provider.dart';

class OrdersItems {
  final id;
  final amount;
  final DateTime time;
  final List<CartItem> cartItems;

  OrdersItems(
      {@required this.id,
      @required this.amount,
      @required this.cartItems,
      @required this.time});
}

class OrdersProvider with ChangeNotifier {
  List<OrdersItems> _orders = [];

  List<OrdersItems> get orders {
    return [..._orders];
  }

  void addNewOrders(List<CartItem> cartItem, double total) {
    _orders.insert(
        0,
        OrdersItems(
            id: DateTime.now().toString(),
            amount: total,
            cartItems: cartItem,
            time: DateTime.now()));
    print(_orders);
    notifyListeners();
  }
}
