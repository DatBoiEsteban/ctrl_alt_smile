import 'dart:io';
import 'dart:typed_data';

import 'consts.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

import 'filters.dart';

class VistaImagen extends StatefulWidget {
  VistaImagen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _VistaImagenState createState() => _VistaImagenState();
}

class _VistaImagenState extends State<VistaImagen> {
  Widget _carruselBotones() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: COLOR_BOTON_MENU,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
            child: Icon(Icons.add_a_photo),
            backgroundColor: COLOR_BOTON_CAMARA,
            onTap: getFromCamera,
            label: 'Tomar Foto',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: COLOR_BOTON_CAMARA),
        SpeedDialChild(
            child: Icon(Icons.crop_original),
            backgroundColor: COLOR_BOTON_GALERIA,
            onTap: getFromGallery,
            label: 'Selecionar de Galeria',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: COLOR_BOTON_GALERIA),
        SpeedDialChild(
            child: Icon(Icons.share),
            backgroundColor: COLOR_PRIMARIO,
            onTap: shareImage,
            label: 'Compartir imagen',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: COLOR_PRIMARIO)
      ],
    );
  }

  imageLib.Image _image;
  File imageFile;
  String fileName;
  List<Filter> filters = nuestraListaDeFiltros;

  Future shareImage() async {
    if (_image != null) {
      Uint8List imgdata = _image.getBytes();
      List<int> img = new List();
      imgdata.forEach(((elemento) => img.add(elemento)));
      Share.file("imagen.png", "imagen.png", img, "image/png");
    }
  }

  Future getFromCamera() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    fileName = basename(imageFile.path);
    var image = imageLib.decodeImage(imageFile.readAsBytesSync());
    image = imageLib.copyResize(image, width: 600);
    setState(() {
      _image = image;
    });
  }

  Future getFromGallery() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    fileName = basename(imageFile.path);
    var image = imageLib.decodeImage(imageFile.readAsBytesSync());
    image = imageLib.copyResize(image, width: 600);
    setState(() {
      _image = image;
    });
  }

  Future applyFilter(
      BuildContext context, imageLib.Image img, String fname) async {
    Map imagefile = await Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new PhotoFilterSelector(
                image: img,
                filters: filters,
                filename: fname,
                title: Text(TITULO),
              )),
    );
    if (imagefile != null) {
      var image =
          imageLib.decodeImage(imagefile['image_filtered'].readAsBytesSync());
      setState(() {
        imageFile = imagefile['image_filtered'];
        _image = image;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Center(
          child:
              _image == null ? Text(MENSAJE_NO_IMAGEN) : Image.file(imageFile),
        ),
        RaisedButton(
          elevation: 1,
          highlightElevation: 1,
          disabledElevation: 1,
          clipBehavior: Clip.none,
          onPressed: () {
            if (_image != null) {
              applyFilter(context, _image, fileName);
            }
          },
          child: Text("Aplicar Filtro"),
        )
      ]),
      floatingActionButton: _carruselBotones(),
    );
  }
}
