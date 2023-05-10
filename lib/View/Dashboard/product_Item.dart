import 'package:easy_shopp/Provider/products.dart';
import 'package:easy_shopp/Provider/root_provider.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopp/View/Dashboard/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final int index;
  const ProductItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          footer: GridTileBar(
            trailing: IconButton(
              color: Theme.of(context).colorScheme.secondary,
              icon: const Icon(Icons.shopping_bag),
              onPressed: () {},
            ),
            leading: Consumer<Product>(
              builder: (context, product, _) => IconButton(
                color: Colors.grey,
                icon: product.isFavorite
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      )
                    : Icon(Icons.favorite_border),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              ),
            ),
            backgroundColor: Colors.black54,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetail(
                  title: product.title,
                  id: product.id,
                  imageUrl: product.imageUrl,
                ),
              ));
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
