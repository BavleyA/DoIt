import 'package:do_it/features/Archived_Tasks/presentation/views/archived_tasks_screen.dart';
import 'package:do_it/features/Done_Tasks/presentation/views/done_tasks_screen.dart';
import 'package:do_it/features/Profile/presentation/views/profile_screen.dart';
import 'package:do_it/features/Tasks/presentation/views/tasks_screen.dart';
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
            TasksScreen(),
            DoneTasksScreen(),
            ArchivedTasksScreen(),
            ProfileScreen(),
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
              NavigationDestination(icon: Icon(Iconsax.task), label: "Tasks"),
              NavigationDestination(icon: Icon(Icons.check_circle_outline), label: "Done"),
              NavigationDestination(icon: Icon(Iconsax.archive), label: "Archived"),
              NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
            ])
    );
  }
}