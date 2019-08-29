import 'dart:io';
import 'consts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';

class VistaImagen extends StatefulWidget {
  VistaImagen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _VistaImagenState createState() => _VistaImagenState();
}

class _VistaImagenState extends State<VistaImagen> {
  File _image;

  Future getFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _image == null ? Text(MENSAJE_NO_IMAGEN) : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getFromCamera,
        tooltip: 'Tomar Foto',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
