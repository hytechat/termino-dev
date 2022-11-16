import 'package:flutter/material.dart';
import 'package:termino_frontend/app.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/home_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/login_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/profil_einsehen_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/register_page.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/termin_erstellen.dart';
import 'package:termino_frontend/pages/pagesGeruest/views/termine_einsehen_page.dart';

import 'pages/pagesGeruest/profile_details/appbar_widget.dart';

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
      home: Login(),
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => RegisterPage(),
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
  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      /*appBar: AppBar(backgroundColor: Colors.white),*/
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        children: [
          HomePage(),
          TerminErstellenPage(),
          TermineEinsehenPage(),
          ProfilEinsehenPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        backgroundColor: const Color.fromRGBO(217, 211, 199, 1),
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Neu"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Termine"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
        onTap: (newIndex) {
          pageController.animateToPage(newIndex,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}
