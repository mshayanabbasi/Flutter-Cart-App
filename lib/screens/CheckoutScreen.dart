import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  final cart;
  final sum;

  CheckOutScreen(this.cart, this.sum);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(cart[index].name),
                trailing: Text(
                  "\$${cart[index].price}",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: cart.length,
            shrinkWrap: true,
          ),
          Divider(),
          Text("Total: \$${sum}"),
        ],
      ),
    );
  }
}
