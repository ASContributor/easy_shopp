import 'dart:ffi';
// ignore_for_file: unnecessary_import, implementation_imports, unused_import, duplicate_import
import 'package:easy_shopp/Provider/cart_provider.dart';
import 'package:easy_shopp/View/Order/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/cart_provider.dart';
import '../../Provider/orders.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart = Provider.of<CartProvider>(context);

    //Map<String, CartItem> Item = Cartitem.Items[0];
    var Item = Cart.list_of_Item;
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Card(
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: ListView.builder(
                  itemCount: Cart.Items.length,
                  itemBuilder: (BuildContext, index) {
                    return ListItemCart(
                      id: Item[index].id,
                      productId: Cart.Items.keys.toList()[index],
                      price: Item[index].price,
                      title: Item[index].title,
                      quantity: Item[index].quantity,
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: Text('Total \$ ${Cart.total_Item_Amount}')),
                TextButton(
                  onPressed: () {
                    Provider.of<Order>(context, listen: false)
                        .addOrder(Item, Cart.total_Item_Amount);
                    Cart.clearCart();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderScreen()));
                  },
                  child: const Text('Order Now'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemCart extends StatelessWidget {
  const ListItemCart({
    super.key,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
    required this.productId,
  });

  final String id;
  final double price;
  final String productId;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    final Cart = Provider.of<CartProvider>(context);
    return Dismissible(
      onDismissed: (direction) {
        Cart.remove_Cart_Item(productId);
      },
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        padding: const EdgeInsets.only(right: 5),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        child: ListTile(
          trailing: Text('${quantity} X'),
          title: Text("${title}"),
          subtitle: Text('Price : $price'),
        ),
      ),
    );
  }
}
