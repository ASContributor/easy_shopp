import 'package:easy_shopp/Provider/root_provider.dart';
import 'package:easy_shopp/View/Dashboard/productItem.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: Provider.of<Root_provider>(context).loadedProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2),
          itemBuilder: (ctx, i) => ProductItem(
                index: i,
              )),
    );
  }
}
