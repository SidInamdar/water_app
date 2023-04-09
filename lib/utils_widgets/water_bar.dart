import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:water_app/classes/changeList.dart';

class WaterBar extends StatelessWidget {
  const WaterBar({Key? key, required this.filled}) : super(key: key);
  final filled;

  double validated_filled(double filled) {
    return (filled > 0.0) ? filled : 0.0;
  }

  double crateProportion(double current, double expected) {
    return current / expected;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 10,
        child:
            Consumer<VesselsListClass>(builder: (context, vesselsList, child) {
          double filled = validated_filled(crateProportion(
              vesselsList.currentWaterIntake, vesselsList.expectedWaterIntake));
          return LiquidLinearProgressIndicator(
            value: filled, // Defaults to 0.5.
            valueColor: AlwaysStoppedAnimation(Colors
                .lightBlue), // Defaults to the current Theme's accentColor.
            backgroundColor: Color.fromARGB(255, 218, 218,
                218), // Defaults to the current Theme's backgroundColor.
            borderColor: Colors.red,
            borderWidth: 5.0,
            borderRadius: 80.0,
            direction: Axis
                .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
            center: RotatedBox(
                quarterTurns: -1,
                child: Text('${(filled * 100).toInt().toString()} %')),
          );
        }));
  }
}
