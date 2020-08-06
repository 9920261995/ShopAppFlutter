import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Providers/orders_provider.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrdersItems orderItem;

  OrderItem({this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("\$${orderItem.amount}"),
            subtitle: Text(DateFormat('dd/ MM/ yyyy').format(orderItem.time)),
            trailing:
                IconButton(icon: Icon(Icons.expand_more), onPressed: () {}),
          )
        ],
      ),
    );
  }
}
