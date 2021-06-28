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
      backgroundColor: Colors.white,
     body: Center(child: 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
       Container(
         child: _image==null?Center(child: Text("Image goes here")): Image.file(_image!),
         height: 300,width: 200,
         decoration: BoxDecoration(border: Border.all(width:3),
         borderRadius: BorderRadius.circular(15)
         ),
       ),
       ],
     ),),
     floatingActionButton: FloatingActionButton(onPressed: () { 
       getImage();
      },child: Icon(Icons.camera_alt),),
    );
  }
}