import 'package:e_commerce/util.dart';
import 'package:e_commerce/views/cart_page.dart';
import 'package:e_commerce/views/detail_page.dart';
import 'package:e_commerce/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        "detailPage":(context) => DetailPage(),
        "cartPage":(context) => CartPage(),
        // "cartPage":(context) => Cart
      },
    );
  }
}
