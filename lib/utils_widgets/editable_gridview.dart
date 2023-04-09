import 'package:flutter/material.dart';
import 'package:water_app/classes/vessel.dart';
import 'package:water_app/classes/changeList.dart';
import 'package:provider/provider.dart';
import 'package:water_app/classes/changeList.dart';

class GridLog extends StatefulWidget {
  const GridLog({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  State<GridLog> createState() => _GridLogState();
}

class _GridLogState extends State<GridLog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VesselsListClass>(builder: (context, vesselsList, child) {
      return GridView.count(
        primary: false,
        padding: EdgeInsets.all(1.0),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 4,
        children:
            List<Widget>.generate(vesselsList.vesselsList.length, (index) {
          return VesselButton(
              widget.constraints,
              vesselMap[vesselsList.vesselsList[index]]!,
              vesselsList.datesList[index],
              index);
        }).toList(),
      );
    });
  }

  SizedBox VesselButton(
      BoxConstraints constraints, Vessel vessel, String datestr, int index) {
    return SizedBox(
      width: (constraints.maxWidth / 4) - 2,
      height: constraints.maxWidth / 4,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 65, 65, 65)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(
                          color: Color.fromARGB(255, 190, 190, 190),
                          width: 2.0)))),
          onPressed: () {},
          onLongPress: () {
            Provider.of<VesselsListClass>(context, listen: false)
                .deleteItem(index);
          },
          child: Column(
            children: [
              Image.asset(
                vessel.imgPath,
              ),
              FittedBox(fit: BoxFit.fitWidth, child: Text(datestr))
            ],
          )),
    );
  }
}
