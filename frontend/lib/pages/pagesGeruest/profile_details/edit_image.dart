import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:termino_frontend/config/config_expo.dart';
import 'appbar_widget.dart';
import 'package:termino_frontend/pages/pagesGeruest/profile_details/user_data.dart';

class EditImagePage extends StatefulWidget {
  const EditImagePage({Key? key}) : super(key: key);

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  var user = UserData.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colourpalette.hellbeigeGrau,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Divider(
            color: Colors.white,
            height: 30,
          ),
          const SizedBox(
              width: 330,
              child: Text(
                "Neues Foto hochladen:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                  width: 330,
                  height: 330,
                  child: GestureDetector(
                    onTap: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      if (image == null) return;

                      final location = await getApplicationDocumentsDirectory();
                      final name = basename(image.path);
                      final imageFile = File('${location.path}/$name');
                      final newImage =
                          await File(image.path).copy(imageFile.path);
                      setState(
                          () => user = user.copy(imagePath: newImage.path));
                    },
                    child: Image.network(user.image),
                  ))),
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 330,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(195, 16, 4, 1),
                        minimumSize: const Size.fromHeight(2),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Akzeptieren',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
