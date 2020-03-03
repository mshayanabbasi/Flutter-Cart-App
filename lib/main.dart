import './ProductModal.dart';

import './screens/CheckoutScreen.dart';
import './screens/ProductScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartApp(),
    );
  }
}

class CartApp extends StatefulWidget {
  CartApp({Key key}) : super(key: key);

  @override
  _CartAppState createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  List<ProductModal> cart = [];
  int sum = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat Application'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Products",
              ),
              Tab(
                text: "Checkout",
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          ProductScreen((selectedProduct) {
            setState(() {
              cart.add(selectedProduct);
              sum = 0;
              cart.forEach((item) {
                sum = sum + item.price;
              });
            });
          }),
          CheckOutScreen(cart, sum),
        ],),
      ),
    );
  }
}
