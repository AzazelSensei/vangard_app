import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vangard_app/add_pages/add_post.dart';
import 'package:vangard_app/extensions/ui_extension.dart';
import 'package:vangard_app/pages/view/competition_page.dart';
import 'package:vangard_app/pages/view/create_page.dart';
import 'package:vangard_app/pages/view/home_page.dart';
import 'package:vangard_app/pages/view/login_page.dart';
import 'package:vangard_app/pages/view/profile_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _index = 0;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: dynamicPage,
        floatingActionButton: floatingActionButton(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: GNav(
              rippleColor: Colors.grey, // tab button ripple color when pressed
              hoverColor: Colors.grey, // tab button hover color
              haptic: true, // haptic feedback
              tabBorderRadius: 15,
              onTabChange: (index) {
                _index = index;
                setState(() {});
              },
              tabActiveBorder: Border.all(
                  color: Colors.black, width: 1), // tab button border
              tabBorder: Border.all(
                  color: Colors.white, width: 0), // tab button border
              // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
              curve: Curves.easeIn, // tab animation curves
              duration:
                  const Duration(milliseconds: 200), // tab animation duration
              gap: 8, // the tab button gap between icon and text
              color: Colors.grey[800], // unselected icon color
              activeColor: HexColor("9962DB"), // selected icon and text color
              iconSize: 30, // tab button icon size

              tabBackgroundColor: HexColor("F3EDF2")
                  .withOpacity(1), // selected tab background color
              padding: context.lowPadding * 0.08,
              tabs: [
                GButton(
                  borderRadius: BorderRadius.circular(50),
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  borderRadius: BorderRadius.circular(50),
                  icon: Icons.tour,
                  text: 'Competition',
                ),
                GButton(
                  borderRadius: BorderRadius.circular(50),
                  icon: Icons.create_rounded,
                  text: 'Create',
                ),
                GButton(
                  borderRadius: BorderRadius.circular(50),
                  icon: Icons.person_rounded,
                  text: 'Profile',
                )
              ]),
        ));
  }

  SpeedDial floatingActionButton() {
    return SpeedDial(
      curve: Curves.bounceIn,
      foregroundColor: Colors.white,
      childrenButtonSize: MediaQuery.of(context).size.height * 0.06,
      backgroundColor: HexColor("9962DB"),
      overlayColor: Colors.grey,
      animatedIcon: AnimatedIcons.menu_close,
      direction: SpeedDialDirection.up,
      spacing: 40,
      overlayOpacity: 0.1,
      childMargin: const EdgeInsets.all(20),
      children: [
        SpeedDialChild(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddPost()));
          },
          shape: const CircleBorder(),
          labelBackgroundColor: HexColor("9962DB"),
          labelStyle: const TextStyle(color: Colors.white),
          foregroundColor: Colors.white,
          backgroundColor: HexColor("9962DB"),
          child: const Icon(Icons.add),
          label: "Add Post",
        ),
        SpeedDialChild(
            onTap: () {},
            labelBackgroundColor: HexColor("9962DB"),
            labelStyle: const TextStyle(color: Colors.white),
            foregroundColor: Colors.white,
            backgroundColor: HexColor("9962DB"),
            child: const Icon(Icons.add_task_outlined),
            label: "Add Competition Post"),
        SpeedDialChild(
          onTap: () {},
          labelBackgroundColor: HexColor("9962DB"),
          labelStyle: const TextStyle(color: Colors.white),
          foregroundColor: Colors.white,
          backgroundColor: HexColor("9962DB"),
          child: const Icon(Icons.leak_add),
          label: "Create Combine",
        ),
        SpeedDialChild(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          labelBackgroundColor: HexColor("9962DB"),
          labelStyle: const TextStyle(color: Colors.white),
          foregroundColor: Colors.white,
          backgroundColor: HexColor("9962DB"),
          child: const Icon(Icons.close_outlined),
          label: "Sign Out",
        ),
      ],
    );
  }

  Widget get dynamicPage {
    if (_index == 0) {
      return const HomePage();
    } else if (_index == 1) {
      return const CompetitionPage();
    } else if (_index == 2) {
      return const CreatePage();
    } else if (_index == 3) {
      return const ProfilePage();
    } else {
      return const Text('NotFound');
    }
  }
}
