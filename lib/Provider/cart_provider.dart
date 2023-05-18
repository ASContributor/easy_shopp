import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _Items = {};
  get Items {
    return {..._Items};
  }

  double get total_Item_Amount {
    var total = 0.0;
    _Items.forEach((key, CartItem) {
      total += CartItem.price * CartItem.quantity;
    });
    return total;
  }

  get list_of_Item {
    List Cart_Item_List = Items.values.toList();

    return Cart_Item_List;
  }

  void remove_Cart_Item(String productId) {
    print('product id: $productId');
    _Items.remove(productId);
    notifyListeners();
  }

  void addItem({
    required String productId,
    required double price,
    required String title,
  }) {
    print('Data');
    print(productId);
    print(title);
    if (_Items.containsKey(productId)) {
      _Items.update(
        productId,
        (existingItem) => CartItem(
            id: existingItem.id,
            title: existingItem.title,
            quantity: existingItem.quantity + 1,
            price: existingItem.price),
      );
    } else {
      _Items.putIfAbsent(
          productId,
          () => CartItem(
                id: 'C0$productId',
                title: title,
                quantity: 1,
                price: price,
              ));
      // print('object');
      // print(_Items[0]);
    }

    notifyListeners();
  }
}
