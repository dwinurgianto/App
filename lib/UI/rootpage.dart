import "package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:food_app/UI/Screen/chatpage.dart";
import "package:food_app/UI/Screen/favoritepage.dart";
import "package:food_app/UI/Screen/homepage.dart";
import "package:food_app/UI/Screen/profilepage.dart";
import "package:google_fonts/google_fonts.dart";

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    ChatPage(),
    ProfilePage(),
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.chat,
    Icons.person,
  ];

  List<String> titleList = [
    "Home",
    "Favorite",
    "Chat",
    "Profil",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomIndex],
              style: GoogleFonts.montserrat(
                color: const Color.fromARGB(255, 12, 52, 36),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 12, 52, 36).withOpacity(0.4),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Color.fromARGB(255, 12, 52, 36),
        activeColor: Color.fromARGB(255, 12, 52, 36),
        inactiveColor: Color.fromARGB(255, 12, 52, 36).withOpacity(.6),
        icons: iconList,
        activeIndex: _bottomIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomIndex = index;
          });
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('_bottomIndex', _bottomIndex));
  }
}
