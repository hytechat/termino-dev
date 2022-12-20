import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:termino_frontend/classes/Option.dart';
import 'package:termino_frontend/config/colours.dart';
import 'package:termino_frontend/data/model/option_model.dart';
import 'package:termino_frontend/pages/pagesGeruest/profile_details/appbar_widget.dart';
import 'package:termino_frontend/pages/pagesGeruest/profile_details/display_image_widget.dart';
import 'package:termino_frontend/pages/pagesGeruest/profile_details/user_data.dart';

class AbstimmungEinsehenPage extends StatefulWidget {
// const AbstimmungEinsehenPage({Key? key}) : super(key: key);
  final String organizer;
  final String titel;
  final String place;

  final List<OptionModel>? options;

  const AbstimmungEinsehenPage(
      {super.key,
      required this.organizer,
      required this.titel,
      required this.place,
      required this.options});

  @override
  _AbstimmungEinsehenPage createState() =>
      _AbstimmungEinsehenPage(organizer, titel, place, options);
}

class _AbstimmungEinsehenPage extends State<AbstimmungEinsehenPage> {
  final String organizer2;
  final String titel2;
  final String place2;
  final List<OptionModel>? options2;

  int currentIndex = 0;

    PageController pageController = PageController(initialPage: 0);


  var user = UserData.myUser;

  List<OptionModel> _openoptions = [];

  _AbstimmungEinsehenPage(
      this.organizer2, this.titel2, this.place2, this.options2);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    bool isChecked = false;

    return Scaffold(
        backgroundColor: Colourpalette.hellbeigeGrau,
        appBar: buildAppBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 300,
              child: Text(
                "Abstimmung einsehen",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.98,
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Titel des Termins'),
                      initialValue: titel2,
                      enabled: false,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.98,
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Ort'),
                      initialValue: place2,
                      enabled: false,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.98,
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Organisator'),
                      initialValue: organizer2,
                      enabled: false,
                    ),
                  ),
                ),
              ],
            ),
            for (var i = 0; i < options2!.length; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: Image.network(
                        user.image,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  Center(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(user.name),
                  )),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Start'),
                        initialValue: options2![i].startDate.toString(),
                        enabled: false,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Ende'),
                        initialValue: options2![i].endDate.toString(),
                        enabled: false,
                      ),
                    ),
                  ),
                  Center(
                    child: Checkbox(
                      checkColor: Colors.lightGreen,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = !value!;
                        });
                      },
                    ),
                  ),
                  // Text ('Start Date ${options2![i].startDate}'),
                  /*
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width * 0.98,
                    child: DecoratedBox(
                        decoration: const BoxDecoration(color: Colors.grey)),
                  ),
                )*/
                ],
              )
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
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Termine"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          ],
          onTap: (newIndex) {
            pageController.animateToPage(newIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
        ));
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.lightGreen;
    }
    return Colors.grey;
  }
}
