import 'package:flutter/material.dart';
import 'package:food_app/components/product.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemProducts extends StatelessWidget {
  final Product product;
  final Function() press;
  const ItemProducts({
    super.key,
    required this.product,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        // childAspectRatio: 0.58,
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        // crossAxisCount: 2,
        children: [
          // for (int i = 1; i < 9; i++)
          Container(
            padding: EdgeInsets.only(left: 8, top: 8, right: 8),
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            // height: 300,
            // width: 160,
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Hero(
                        tag: "${product.id}",
                        child: Image.asset(
                          product.image,
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.title,
                    style: GoogleFonts.montserrat(
                      color: Color.fromARGB(255, 221, 221, 221),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.description,
                    style: GoogleFonts.montserrat(
                      color: Color.fromARGB(255, 221, 221, 221),
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\Rp ${product.price}",
                        style: GoogleFonts.montserrat(
                          color: Color.fromARGB(255, 221, 221, 221),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 24,
                          color: Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.8),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
