import 'dart:typed_data';
import 'package:photofilters/filters/color_filters.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/subfilters.dart';

// Vamos a crear un filtro nuevo!!!

class MiFiltroPersonalizado extends ColorFilter{ //se declaró un nuevo filtro para el app

//Vamos a configurar el filtro

  //var nivelDeSaturacion = 50; // se puede escoger un nuevo valor de saturacion, edite el numero.


//se pueden editar los valores de RBG (rojo, verde y azul) y una escala.

  var nivelDeRojo = 255; //edite y juegue con los valores.

  var nivelDeVerde = 50; //edite y juegue con los valores. 

  var nivelDeAzul = 120; //edite y juegue con los valores.

  var nivelDeEscala = 0.2; //edite y juegue con los valores. 


  var nivelDeConstrate = 0.0; //se puede escoger un nuevo valor de contraste, edite el numero.
  

  MiFiltroPersonalizado() : super(name: "Mi Primer Filtro"){ //Se le puede editar el nombre de su nuevo filtro, edite el texto entre las comillas.
    
    subFilters.add(new RGBOverlaySubFilter(nivelDeRojo, nivelDeVerde, nivelDeAzul, nivelDeEscala)); 
    //subFilters.add(new SaturationSubFilter(nivelDeSaturacion)); 
    subFilters.add(new ContrastSubFilter(nivelDeConstrate)); 

  } 

}


//Aqui hay algunos ejemplo de filtros que se pueden hacer!!

class NoFilter extends ColorFilter {
  NoFilter() : super(name: "No Filter");

  @override
  void apply(Uint8List pixels) {
    // Do nothing
  }
}

class AddictiveBlueFilter extends ColorFilter {
  AddictiveBlueFilter() : super(name: "AddictiveBlue") {
    subFilters.add(new AddictiveColorSubFilter(0, 0, 50));
  }
}

// Earlybird: Gives an older look with a sepia tint and warm temperature
class EarlybirdFilter extends ColorFilter {
  EarlybirdFilter() : super(name: "Earlybird") {
    subFilters.add(new RGBOverlaySubFilter(255, 165, 40, 0.2));
    subFilters.add(new SaturationSubFilter(0.15));
  }
}

// Nashville: Warms the temperature, lowers contrast and increases exposure to give a light "pink" tint – making it feel "nostalgic"
class NashvilleFilter extends ColorFilter {
  NashvilleFilter() : super(name: "Nashville") {
    subFilters.add(new RGBOverlaySubFilter(220, 115, 188, 0.12));
    subFilters.add(new ContrastSubFilter(-0.05));
  }
}

// Inkwell: Direct shift to black and white
class InkwellFilter extends ColorFilter {
  InkwellFilter() : super(name: "Inkwell") {
    subFilters.add(new GrayScaleSubFilter());
  }
}

// Hefe: Hight contrast and saturation, with a similar effect to Lo-Fi but not quite as dramatic
class HefeFilter extends ColorFilter {
  HefeFilter() : super(name: "Hefe") {
    subFilters.add(new ContrastSubFilter(0.1));
    subFilters.add(new SaturationSubFilter(0.15));
  }
}

//Walden: Increases exposure and adds a yellow tint
class WaldenFilter extends ColorFilter {
  WaldenFilter() : super(name: "Walden") {
    subFilters.add(new BrightnessSubFilter(0.1));
    subFilters.add(new RGBOverlaySubFilter(255, 255, 0, 0.2));
  }
}

// X-Pro II: Increases color vibrance with a golden tint, high contrast and slight vignette added to the edges
class XProIIFilter extends ColorFilter {
  XProIIFilter() : super(name: "X-Pro II") {
    subFilters.add(new RGBOverlaySubFilter(255, 255, 0, 0.07));
    subFilters.add(new SaturationSubFilter(0.2));
    subFilters.add(new ContrastSubFilter(0.15));
  }
}


List<Filter> nuestraListaDeFiltros = [
  NoFilter(),
  MiFiltroPersonalizado(),
  AddictiveBlueFilter(),
  EarlybirdFilter(),
  NashvilleFilter(),
  InkwellFilter(),
  HefeFilter(),
  WaldenFilter(),
  XProIIFilter()
];



