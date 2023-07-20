import 'package:flutter/material.dart';
import 'package:food_app/components/product.dart';
import 'package:food_app/components/product_title_with_image.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyDP extends StatelessWidget {
  final Product product;
  const BodyDP({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * .3),
              padding: EdgeInsets.only(
                top: size.height * .12,
                left: 16.0,
                right: 16.0,
              ),
              height: size.height * 1,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                children: [
                  ProductDescription(product: product),
                  SizedBox(height: 200),
                  buttonLike(),
                  SizedBox(height: 20),
                  AddCart(product: product)
                ],
              ),
            ),
            ProductTitleWithImage(product: product)
          ],
        ),
      ),
    );
  }
}

class AddCart extends StatelessWidget {
  const AddCart({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Color.fromARGB(255, 12, 52, 36),
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: OutlinedButton(
                child: Text(
                  "Order Now",
                  style: GoogleFonts.montserrat(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                    backgroundColor: product.color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class buttonLike extends StatelessWidget {
  const buttonLike({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardCart(),
        Container(
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 12, 52, 36).withOpacity(0.4),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductDescription extends StatelessWidget {
  final Product product;
  const ProductDescription({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.montserrat(
                    color: Color.fromARGB(255, 12, 52, 36),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CardCart extends StatefulWidget {
  const CardCart({super.key});

  @override
  State<CardCart> createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlineCart(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        SizedBox(width: 5),
        SizedBox(
          width: 80,
          height: 32,
          child: OutlinedButton(
            child: Text(
              numOfItems.toString().padLeft(2, "0"),
              style: GoogleFonts.montserrat(
                color: Color.fromARGB(255, 12, 52, 36),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () {},
          ),
        ),
        SizedBox(width: 5),
        OutlineCart(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            }),
      ],
    );
  }

  SizedBox OutlineCart({required IconData icon, required Function() press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 255, 255, 255),
            padding: EdgeInsets.zero,
            backgroundColor: Color.fromARGB(255, 12, 52, 36),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
