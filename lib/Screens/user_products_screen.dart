import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/products_provider.dart';
import '../Widgets/user_product_item.dart';
import '../Widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user_products';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.items.length,
          itemBuilder: (context, index) => Column(
            children: [
              UserProductItem(
                  products.items[index].title, products.items[index].imageUrl),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
