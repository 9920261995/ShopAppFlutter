import 'package:flutter/material.dart';
import 'package:shop_app/Providers/cart_provider.dart';
import 'package:shop_app/Providers/product.dart';
import 'package:shop_app/Screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  _handleDetailsTap(BuildContext context, String id) {
    Navigator.of(context)
        .pushNamed(ProductDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Consumer<Product>(
      builder: (context, product, child) => ClipRRect(
        child: GridTile(
            child: GestureDetector(
              onTap: () {
                _handleDetailsTap(context, product.id);
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
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    cart.addProduct(product.id, product.title, product.price);
                    Scaffold.of(context).hideCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Added to the cart!",
                        // textAlign: TextAlign.center,
                      ),
                      duration: Duration(seconds: 1),
                      action: SnackBarAction(
                        label: 'UNDO ',
                        onPressed: () {
                          cart.undoAddItem(product.id);
                        },
                      ),
                    ));
                  },
                  color: Theme.of(context).accentColor,
                ),
              ),
            )),
      ),
    );
  }
}
