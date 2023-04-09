import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:water_app/utils_widgets/icons.dart';
import 'package:water_app/classes/vessel.dart';
import 'package:provider/provider.dart';
import 'package:water_app/classes/changeList.dart';

class VesselRow extends StatelessWidget {
  const VesselRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(children: <Widget>[
        VesselButton(constraints, glass, context),
        SizedBox(
          width: 2,
        ),
        VesselButton(constraints, beaker, context),
        SizedBox(
          width: 2,
        ),
        VesselButton(constraints, jar, context),
        SizedBox(
          width: 2,
        ),
        VesselButton(constraints, cup, context)
      ]);
    });
  }

  SizedBox VesselButton(
      BoxConstraints constraints, Vessel vessel, BuildContext context) {
    return SizedBox(
      width: (constraints.maxWidth / 4) - 2,
      height: constraints.maxWidth / 4,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 69, 135, 197)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red, width: 2.0)))),
          onPressed: () {
            Provider.of<VesselsListClass>(context, listen: false)
                .addItem(vessel.vesselName);
          },
          child: Column(
            children: [
              Image.asset(
                vessel.imgPath,
              ),
              FittedBox(
                  fit: BoxFit.fitWidth, child: Text(vessel.quantityInstring))
            ],
          )),
    );
  }
}
