import 'package:flutter/material.dart';
import 'package:shop_app/Widgets/order_item.dart';
import '../Providers/orders_provider.dart' show OrdersProvider;
import 'package:provider/provider.dart';
import '../Widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders_screen";

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
              child: OrderItem(
            orderItem: ordersData.orders[index],
          ));
        },
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
