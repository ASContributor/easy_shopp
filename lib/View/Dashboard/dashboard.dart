import 'package:easy_shopp/Provider/root_provider.dart';
import 'package:easy_shopp/View/Dashboard/product_Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/products.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final Data = Provider.of<Root_provider>(context);
    final lengthlist = Data.loadedProduct.length;
    return Scaffold(
      appBar: AppBar(
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
                value: Data.loadedProduct[i],
                child: ProductItem(
                  index: i,
                ),
              )),
    );
  }
}
