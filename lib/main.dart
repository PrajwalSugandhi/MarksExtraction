//import 'dart:html';
import 'dart:io';
import 'package:btp/Python.dart';
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
  late File selected_image;
  late Python python;
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
            onPressed: () {
              _pickImagefromCamera();

            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            python = Python(image: selected_image);
            python.initialize("python", "main.py", false);
            python.croptable();
            //Navigator.push(context, MaterialPageRoute(builder: (context) => Demo(image: selected_image)));
          },
      ),
    );
  }

  Future _pickImagefromCamera() async {
    final returnedimage = await ImagePicker().pickImage(source: ImageSource.camera);
    selected_image = File(returnedimage!.path);

  }
}

