import 'package:flutter/material.dart';

class Vessel {
  final String vesselName;
  final String imgPath;
  final int quantityInML;
  final String quantityInstring;

  Vessel(
      this.vesselName, this.imgPath, this.quantityInML, this.quantityInstring);

  factory Vessel.newVessel(vesselName, imgPath, quantityInML) {
    String quantityInstring = Vessel.quantityToString(quantityInML);
    return Vessel(vesselName, imgPath, quantityInML, quantityInstring);
  }

  static String quantityToString(int quantity) {
    return '${quantity.toString()} ml';
  }
}

Vessel glass = Vessel.newVessel("glass", 'assets/images/water_glass.png', 200);
Vessel beaker =
    Vessel.newVessel("beaker", 'assets/images/measuring-cup.png', 100);
Vessel jar = Vessel.newVessel("jar", 'assets/images/jar.png', 500);
Vessel cup = Vessel.newVessel("cup", 'assets/images/cup.png', 50);

Map<String, Vessel> vesselMap = {
  glass.vesselName: glass,
  beaker.vesselName: beaker,
  jar.vesselName: jar,
  cup.vesselName: cup
};
