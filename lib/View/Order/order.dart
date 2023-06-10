import 'package:easy_shopp/Provider/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DataOrders = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Your Orders'),
      ),
      body: ListView.builder(
          itemCount: DataOrders.orders.length,
          itemBuilder: (context, i) =>
              OrderCard(OrderDetail: DataOrders.orders[i])),
    );
  }
}

Widget OrderCard({OrderDetail}) {
  return Card(
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text('\$${OrderDetail.amount}'),
          subtitle: Text(DateFormat('dd mm yyyy').format(
            OrderDetail.dateTime,
          )),
        )
      ],
    ),
  );
}
