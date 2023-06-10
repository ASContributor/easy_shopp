import 'package:easy_shopp/Provider/cart_provider.dart';
import 'package:easy_shopp/Provider/orders.dart';
import 'package:easy_shopp/Provider/root_provider.dart';
import 'package:easy_shopp/View/Order/order.dart';
import 'package:easy_shopp/View/Product/product_Item.dart';
import 'package:easy_shopp/View/Cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore_for_file: unnecessary_import, implementation_imports, unused_import, duplicate_import
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
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Text('Profile')),
            ListTile(
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              title: Text('My Order'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(),
                    ));
              },
            )
          ],
        ),
      ),
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
              icon: const Icon(Icons.shopping_cart)),
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
              const PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOption.Favorites,
              ),
              const PopupMenuItem(
                child: Text('All Item'),
                value: FilterOption.All,
              )
            ],
          )
        ],
        title: const Text('Dashboard'),
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
