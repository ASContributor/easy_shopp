import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final double price;
  const ProductDetail(
      {super.key,
      required this.title,
      required this.id,
      required this.imageUrl,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                width: double.infinity,
                image: NetworkImage(imageUrl),
              ),
              Text('Price: \$ ${price}')
            ],
          ),
        ));
  }
}
