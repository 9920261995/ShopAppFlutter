import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/cart_provider.dart';
import 'package:shop_app/Screens/cart_screens.dart';
import 'package:shop_app/Widgets/app_drawer.dart';
import '../Widgets/badge.dart';
// import 'package:shop_app/Providers/products_provider.dart';
// import './Providers/products_provider.dart'

import '../Widgets/products_grid.dart';

enum FilterOptions { All, Favourites }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    // final productsContainer =
    //     Provider.of<ProductsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        actions: <Widget>[
          Consumer<CartProvider>(
            builder: (context, cart, ch) =>
                Badge(child: ch, value: cart.cartItemCount.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
              onSelected: (FilterOptions value) => {
                    if (value == FilterOptions.Favourites)
                      {
                        setState(() {
                          _showOnlyFavourites = true;
                        })
                      }
                    else
                      {
                        setState(() {
                          _showOnlyFavourites = false;
                        })
                      }
                    // {productsContainer.showAllItems()}
                  },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("Only Favourites "),
                      value: FilterOptions.Favourites,
                    ),
                    PopupMenuItem(
                      child: Text("Show All "),
                      value: FilterOptions.All,
                    )
                  ]),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
