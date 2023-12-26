import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flython/flython.dart';

// class Demo extends StatefulWidget {
//   File image;
//   Demo({Key ? key, required this.image}) : super(key: key);
//
//   @override
//   State<Demo> createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('hi'),
//       ),
//       body: Expanded(child: Image.file(widget.image)),
//     );
//   }
// }

class Python extends Flython{
  File image;
  var file;
  Python({required this.image}){
    file = {
      "path": this.image,
    };
  }
  Future<void> croptable() async {
      await runCommand(file);
  }
}



