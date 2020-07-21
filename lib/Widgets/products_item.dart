import 'package:flutter/material.dart';
import 'package:shop_app/Screens/product_detail_screen.dart';
// import 'package:shop_app/Models/product.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  _handleDetailsTap(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ProductDetailScreen.routeName, arguments: {'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: GestureDetector(
          onTap: () {
            _handleDetailsTap(context);
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              title,
              // style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
          ),
        ));
  }
}
