import 'package:flutter/material.dart';
import 'package:shop_app/Providers/cart_provider.dart';
import 'package:shop_app/Providers/product.dart';
import 'package:shop_app/Screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  _handleDetailsTap(BuildContext context) {
    Navigator.of(context).pushNamed(ProductDetailScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Consumer<Product>(
      builder: (context, product, child) => ClipRRect(
        child: GridTile(
            child: GestureDetector(
              onTap: () {
                _handleDetailsTap(context);
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            footer: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTileBar(
                backgroundColor: Colors.black54,
                leading: IconButton(
                  icon: Icon(product.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {
                    product.toggleFavouriteStatus();
                  },
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  product.title,
                  // style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.shopping_basket),
                  onPressed: () {
                    cart.addProduct(product.id, product.title, product.price);
                  },
                  color: Theme.of(context).accentColor,
                ),
              ),
            )),
      ),
    );
  }
}
