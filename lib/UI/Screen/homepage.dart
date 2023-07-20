// ignore_for_file: unused_local_variable

import "package:flutter/material.dart";
import "package:food_app/components/item.dart";
import "package:food_app/components/product.dart";
import "package:google_fonts/google_fonts.dart";

import '../../components/detail_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    // Fav Button
    // bool toggleIsFavorite(bool isFavorited) {
    //   return !isFavorited;
    // };

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      width: size.width * .9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 12, 52, 36)
                                .withOpacity(0.4),
                          ),
                          const Expanded(
                            child: TextField(
                              showCursor: false,
                              decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 12, 52, 36).withOpacity(.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.shopping_cart,
                    //         color:
                    //             Color.fromARGB(255, 12, 52, 36).withOpacity(.6),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Best Seller",
                      style: GoogleFonts.montserrat(
                        color: const Color.fromARGB(255, 12, 52, 36),
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    LimitedBox(
                      maxHeight: 400,
                      child: PageView.builder(
                        itemCount: image_data.length,
                        onPageChanged: (index) {
                          setState(() {
                            _imageIndex = index;
                          });
                        },
                        itemBuilder: ((context, index) => imageclass(
                              images: image_data[index].image,
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          image_data.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(left: 5, top: 10),
                            child:
                                imageindicator(isActive: index == _imageIndex),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.montserrat(
                          color: const Color.fromARGB(255, 12, 52, 36),
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Menu",
                      style: GoogleFonts.montserrat(
                        color: const Color.fromARGB(255, 12, 52, 36),
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.58,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ItemProducts(
                          product: products[index],
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailProduct(
                                  products[index],
                                  Products: products[index],
                                ),
                              )),
                        )),
              ),
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //     child: GridView.builder(
              //       itemCount: products.length,
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         childAspectRatio: 0.58,
              //       ),
              //       itemBuilder: (context, index) => ItemProducts(
              //         product: products[index],
              //         press: () {},
              //       ),
              //     ),
              //   ),
              // ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(8.0),
              //       height: 160,
              //       width: size.width * .4,
              //       decoration: BoxDecoration(
              //         color: Color.fromARGB(255, 230, 199, 43).withOpacity(0.4),
              //         borderRadius: BorderRadius.circular(16.0),
              //       ),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(16.0),
              //         child: Image.asset(
              //           "images/image_1.png",
              //           fit: BoxFit.fill,
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(
              //         vertical: 2.0,
              //       ),
              //       child: Text(
              //         "Risol Mayo",
              //         style: GoogleFonts.montserrat(
              //           color: const Color.fromARGB(255, 12, 52, 36),
              //           fontWeight: FontWeight.w400,
              //           fontSize: 12,
              //         ),
              //       ),
              //     ),
              //     Text(
              //       "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              //       textAlign: TextAlign.justify,
              //       style: GoogleFonts.montserrat(
              //         color: const Color.fromARGB(255, 12, 52, 36),
              //         fontWeight: FontWeight.w400,
              //         fontSize: 10,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class imageindicator extends StatelessWidget {
  const imageindicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 8 : 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive
            ? Color.fromARGB(255, 12, 52, 36)
            : Color.fromARGB(255, 12, 52, 36).withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class imageslider {
  final String image;

  imageslider({
    required this.image,
  });
}

final List<imageslider> image_data = [
  imageslider(image: "images/image_1.png"),
  imageslider(image: "images/image_2.png"),
  imageslider(image: "images/image_3.png"),
];

class imageclass extends StatelessWidget {
  const imageclass({
    super.key,
    required this.images,
  });
  final String images;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            images,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
