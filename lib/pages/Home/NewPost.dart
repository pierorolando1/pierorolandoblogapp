import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pierorolandoblog/colors.dart';
import 'package:pierorolandoblog/widgets/buttons/GradientButton.dart';
import 'package:pierorolandoblog/widgets/inputs/NoBorderField.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  bool loadingphoto = false;
  String? imageurl;

  @override
  Widget build(BuildContext context) {
    final cloudinary =
        CloudinaryPublic('piero-rolando', 'planeta-interno', cache: false);

    _uploadImage() async {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      try {
        if (image != null) {
          setState(() {
            loadingphoto = true;
          });
          CloudinaryResponse response = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(image.path,
                resourceType: CloudinaryResourceType.Image),
          );
          setState(() {
            loadingphoto = false;
            imageurl = response.secureUrl;
          });
          print(response.secureUrl);
        }
      } catch (e) {
        print(e);
      }
    }

    return CupertinoPageScaffold(
      backgroundColor: gray_900,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(17, 24, 39, 0.5),
        middle: Text("New post"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 75),
          NoBorderField(
            placeholderText: "Titulo",
            fontSize: 23,
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
            fontWeight: FontWeight.bold,
            placeholderColor: Colors.white30
          ),
          NoBorderField(
            placeholderText: "Descripción",
            fontSize: 20,
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 4),
            fontWeight: FontWeight.w600,
            placeholderColor: Colors.white30
          ),
          NoBorderField(
            placeholderText: "Contenido (opcional)",
            fontSize: 15,
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
            fontWeight: FontWeight.normal,
            placeholderColor: Colors.white30
          ),
          loadingphoto
          ? Padding(
              padding: const EdgeInsets.only(left: 17, top: 5),
              child: CupertinoActivityIndicator(),
          ) : ((imageurl == null)
            ? GradientButton(onTap: _uploadImage, text: "Subir imagen")
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(imageurl!),
            )),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: GradientButton(
                  onTap: (){print("adasd");},
                  text: "Crear"
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
