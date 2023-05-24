import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final double price;
  final String description;
  const ProductDetail(
      {super.key,
      required this.title,
      required this.id,
      required this.imageUrl,
      required this.price,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                image: NetworkImage(imageUrl),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Center(
                    child: Text(
                  '\$ ${price}',
                  style: const TextStyle(fontSize: 20),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(description),
            ],
          ),
        ));
  }
}
