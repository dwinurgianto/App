import 'package:flutter/material.dart';
import 'package:food_app/components/product.dart';

import '../UI/Screen/cartpage.dart';
import '../UI/Screen/notifikasipage.dart';
import 'body.dart';

class DetailProduct extends StatelessWidget {
  final Product Products;
  const DetailProduct(
    Product product, {
    super.key,
    required this.Products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Products.color,
      appBar: buildAppBar(context),
      body: BodyDP(
        product: Products,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_sharp,
          color: Color.fromARGB(255, 12, 52, 36),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Color.fromARGB(255, 12, 52, 36).withOpacity(0.4),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationPage()));
          },
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Color.fromARGB(255, 12, 52, 36).withOpacity(0.4),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
        ),
      ],
    );
  }
}
