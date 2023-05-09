import 'package:easy_shopp/Provider/root_provider.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopp/View/Dashboard/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final int index;
  const ProductItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final loadedProductData = Provider.of<Root_provider>(context);
    final loadedProduct = loadedProductData.loadedProduct;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          footer: GridTileBar(
            trailing: IconButton(
              color: Theme.of(context).colorScheme.secondary,
              icon: const Icon(Icons.shopping_bag),
              onPressed: () {},
            ),
            leading: IconButton(
              color: Theme.of(context).colorScheme.secondary,
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
            backgroundColor: Colors.black54,
            title: Text(
              loadedProduct[index].title,
              textAlign: TextAlign.center,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetail(
                  title: loadedProduct[index].title,
                  id: loadedProduct[index].id,
                  imageUrl: loadedProduct[index].imageUrl,
                ),
              ));
            },
            child: Image.network(
              loadedProduct[index].imageUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
