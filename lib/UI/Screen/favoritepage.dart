import "package:flutter/material.dart";

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
