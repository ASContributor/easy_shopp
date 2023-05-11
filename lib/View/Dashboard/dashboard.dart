import 'package:easy_shopp/Provider/root_provider.dart';
import 'package:easy_shopp/View/Dashboard/product_Item.dart';
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

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
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
