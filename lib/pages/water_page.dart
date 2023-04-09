import 'package:flutter/material.dart';
import 'package:water_app/utils_widgets/water_bar.dart';
import 'package:water_app/utils_widgets/vessels_grid.dart';
import 'package:water_app/utils_widgets/editable_gridview.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({super.key});

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
              width: constraints.maxWidth,
              child: Row(children: [
                Container(
                    color: Color.fromARGB(255, 44, 44, 44),
                    width: constraints.maxWidth * 0.150,
                    height: (constraints.maxHeight),
                    child: WaterBar(
                      filled: 0.5,
                    )),
                Container(
                  color: Color.fromARGB(255, 44, 44, 44),
                  width: constraints.maxWidth * 0.850,
                  height: (constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  //color: Color.fromARGB(255, 44, 44, 44),
                                  height: constraints.maxHeight * 0.80,
                                  child: GridLog(constraints: constraints)),
                              // layout for rows
                              Container(
                                  //color: Color.fromARGB(255, 44, 44, 44),
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  VesselRow(),
                                ],
                              )),
                            ]);
                      },
                    ),
                  ),
                ),
              ]));
        }));
  }
}
