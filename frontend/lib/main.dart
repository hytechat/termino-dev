import 'package:flutter/material.dart';
import 'package:termino_frontend/app.dart';
import 'package:termino_frontend/pages/pagesGeruest/profile_details/edit_name.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/home_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/login_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/profil_einsehen_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/register_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/termin_erstellen.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/termine_einsehen_page.dart';

import 'pages/pagesGeruest/profile_details/appbar_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

/*
void main() {
 runApp( appBasic()); 
  // runApp( RegisterPage());
 runApp( Login());
}
*/

void main() {
  runApp(appBasic());
}

class appBasic extends StatelessWidget {
  const appBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Termino',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Login(),
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const RegisterPage(),
        '/navigation': (context) => const NavigatorPage(),
      },
    );
  }
}

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  //int currentIndex = 0;

  //PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        HomePage(),
        TerminErstellenPage(),
        TermineEinsehenPage(),
        ProfilEinsehenPage(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.house),
          title: ("Home"),
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add),
          title: ("Neu"),
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.calendar_month),
          title: ("Termine"),
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: ("Profil"),
          activeColorPrimary: Colors.black,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    return Scaffold(
      appBar: buildAppBar(context),
    body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    ),
    );
  }
}
