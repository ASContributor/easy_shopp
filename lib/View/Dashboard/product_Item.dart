import 'package:easy_shopp/Provider/cart_provider.dart';
import 'package:easy_shopp/Provider/products.dart';
import 'package:easy_shopp/Provider/root_provider.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopp/View/Dashboard/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final Cart = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          footer: GridTileBar(
            trailing: Consumer<CartProvider>(
              builder: (ctx, Cart, child) => IconButton(
                color: Theme.of(context).colorScheme.secondary,
                icon: const Icon(Icons.shopping_bag),
                onPressed: () {
                  Cart.addItem(
                      productId: product.id,
                      price: product.price,
                      title: product.title);
                },
              ),
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
                  description: product.description,
                  price: product.price,
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
