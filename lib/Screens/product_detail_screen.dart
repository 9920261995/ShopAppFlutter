import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../Models/product.dart';

// import '../Providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product_detatils_screen';

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // var productId = routeArgs['id'];
    // final loadedProduct = Provider.of<ProductsProvider>(context, listen: false)
    //     .productDetails(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text("loadedProduct.title"),
      ),
      body: Container(),
    );
  }
}
