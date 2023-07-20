import 'package:flutter/material.dart';
import 'package:food_app/components/product.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mbah Nonik Recipe",
            style: GoogleFonts.montserrat(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Harga\n",
                      style: GoogleFonts.montserrat(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                    TextSpan(
                      text: "\Rp ${product.price}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
