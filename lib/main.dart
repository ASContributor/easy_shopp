import 'package:easy_shopp/Provider/root_provider.dart';
import 'package:easy_shopp/View/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Root_provider(),
      child: MaterialApp(
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown)
                  .copyWith(secondary: Colors.grey)),
          darkTheme: ThemeData(
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: Colors.black12)),
          home: const Dashboard()),
    );
  }
}
