// ignore_for_file: unused_import

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:food_app/UI/login.dart';
import "package:food_app/UI/rootpage.dart";
import "package:google_fonts/google_fonts.dart";
// import "package:food_app/login.dart";

class introApp extends StatefulWidget {
  const introApp({super.key});

  @override
  State<introApp> createState() => _introAppState();
}

class _introAppState extends State<introApp> {
  late PageController _pageController;

  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF8842B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: ((context, index) => introclass(
                        images: demo_data[index].image,
                        title: demo_data[index].title,
                        description: demo_data[index].description,
                      )),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: introindicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_pageIndex < 1) {
                            _pageIndex++;
                            if (_pageIndex < 2) {
                              _pageController.nextPage(
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 300));
                            }
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Color.fromARGB(255, 12, 52, 36),
                      ),
                      child: SvgPicture.asset(
                        "icons/next.svg",
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('_pageIndex', _pageIndex));
  }
}

class introindicator extends StatelessWidget {
  const introindicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive
            ? Color.fromARGB(255, 12, 52, 36)
            : Color.fromARGB(255, 12, 52, 36).withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class onboardintro {
  final String image, title, description;

  onboardintro({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<onboardintro> demo_data = [
  onboardintro(
    image: "images/intro1.png",
    title: "Order Anywhere",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  ),
  onboardintro(
    image: "images/intro2.png",
    title: "Order Food \n Faster & Earlier",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  ),
];

class introclass extends StatelessWidget {
  const introclass({
    super.key,
    required this.images,
    required this.title,
    required this.description,
  });
  final String images, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          images,
          height: 210,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Color.fromARGB(255, 12, 52, 36),
            textStyle: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: GoogleFonts.montserrat(
            color: Color.fromARGB(255, 12, 52, 36),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
