//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(
      MaterialApp(
        initialRoute: '/',
        routes : {
          '/': (context) => HomePage(),
        }
      )
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File ? selected_image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marks Extraction"),
        centerTitle: true,
        backgroundColor: Colors.green,

      ),

      body: Center(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            shape: BoxShape.circle,

          ),
          child: IconButton(

            icon: Icon(Icons.camera_alt),
            onPressed: (){
              _pickImagefromCamera();
            },
          ),
        ),
      ),
    );
  }

  Future _pickImagefromCamera() async {
    final returnedimage = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      selected_image = File(returnedimage!.path);
    });
  }
}

