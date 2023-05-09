import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  const ProductDetail(
      {super.key,
      required this.title,
      required this.id,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Image(
          image: NetworkImage(imageUrl),
        ));
  }
}
