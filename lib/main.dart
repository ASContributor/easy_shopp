import 'package:easy_shopp/View/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown, accentColor: Colors.grey),
      darkTheme: ThemeData(accentColor: Colors.black12),
      home: Dashboard()));
}
