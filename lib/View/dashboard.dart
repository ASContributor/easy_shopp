import 'package:flutter/material.dart';
import '../Provider/products.dart';

class Dashboard extends StatefulWidget {
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
          itemCount: loadedProduct.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2),
          itemBuilder: (ctx, i) => ProductItem(context, i)),
    );
  }
}

Widget ProductItem(context, int index) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: GridTile(
        footer: GridTileBar(
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
          leading: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          backgroundColor: Colors.black54,
          title: Text(
            loadedProduct[index].title,
            textAlign: TextAlign.center,
          ),
        ),
        child: Image.network(
          loadedProduct[index].imageUrl,
          fit: BoxFit.cover,
        )),
  );
}
