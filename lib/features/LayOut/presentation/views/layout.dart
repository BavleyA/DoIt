import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          children: const [

          ],
        ),
        bottomNavigationBar: NavigationBar(
            elevation: 1,
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
                pageController.jumpToPage(index);
              });
            },
            destinations: [
              NavigationDestination(icon: Icon(Iconsax.message), label: "Chat"),
              NavigationDestination(icon: Icon(Iconsax.messages), label: "Groups"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Contacts"),
              NavigationDestination(icon: Icon(Iconsax.settings), label: "Settings"),
            ])
    );
  }
}