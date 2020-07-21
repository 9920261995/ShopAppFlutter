import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product_detatils_screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    var productId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(productId),
      ),
      body: Container(),
    );
  }
}
