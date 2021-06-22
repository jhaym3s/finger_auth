import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_developer_task/next_screen.dart';
import 'package:image_picker/image_picker.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
       Container(
         height: 300,width: 200,
        decoration:  BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image:FileImage(_image!),
            fit: BoxFit.fitHeight,
          ),
        ),
       ),
         ElevatedButton.icon(onPressed: getImage, 
         icon: Icon(Icons.camera_alt_rounded), 
         label: Text("Camera"),),
       ],
     ),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamed(NextPage.routeName);
      }, child: Icon(Icons.navigate_next),),
    );
  }
}