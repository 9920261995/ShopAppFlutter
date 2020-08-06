import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/cart_provider.dart' show CartProvider;
import 'package:shop_app/Providers/orders_provider.dart';
import '../Widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                        '\$${Provider.of<CartProvider>(context).totalAmount}',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline6
                                .color)),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<OrdersProvider>(context, listen: false)
                          .addNewOrders(
                              cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                    },
                    child: Text(
                      'Order now',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) => CartItem(
              cart.items.values.toList()[index].id,
              cart.items.values.toList()[index].title,
              cart.items.values.toList()[index].quantity,
              cart.items.values.toList()[index].price,
              cart.items.keys.toList()[index],
            ),
            itemCount: cart.cartItemCount,
          ))
        ],
      ),
    );
  }
}
