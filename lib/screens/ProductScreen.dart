import 'package:flutter/material.dart';
import '../ProductModal.dart';

class ProductScreen extends StatelessWidget {

  final ValueSetter<ProductModal> _valueSetter;

  ProductScreen(this._valueSetter);

  List<ProductModal> products = [
    ProductModal('Mic', 50),
    ProductModal('LED Monitor', 100),
    ProductModal('Mouse', 5),
    ProductModal('Keyboard', 10),
    ProductModal('Speaker', 50),
    ProductModal('CD', 3)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            trailing: Text(
              "\$${products[index].price}",
              style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Add Product in CheckOut")));
                _valueSetter(products[index]);
            },
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: products.length);
  }
}
