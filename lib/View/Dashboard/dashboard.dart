import 'package:easy_shopp/Provider/cart_provider.dart';
import 'package:easy_shopp/Provider/root_provider.dart';
import 'package:easy_shopp/View/Product/product_Item.dart';
import 'package:easy_shopp/View/Cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/products.dart';

enum FilterOption { Favorites, All }

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _showonlyfavorite = false;
  @override
  Widget build(BuildContext context) {
    final Data = Provider.of<Root_provider>(context);
    final ListOfItem =
        _showonlyfavorite ? Data.onlyFavorite : Data.loadedProduct;
    final lengthlist = ListOfItem.length;
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const CartScreen(),
                      ),
                    )
                  },
              icon: Icon(Icons.shopping_cart)),
          PopupMenuButton(
            onSelected: (FilterOption selectedvalue) {
              setState(() {
                if (selectedvalue == FilterOption.Favorites) {
                  _showonlyfavorite = true;
                  // Data.FavoriteProductItem();
                } else {
                  _showonlyfavorite = false;
                  // Data.AllProduct();
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text('All Item'),
                value: FilterOption.All,
              )
            ],
          )
        ],
        title: Text('Dashboard'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: lengthlist,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2),
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: ListOfItem[i],
                child: const ProductItem(),
              )),
    );
  }
}
