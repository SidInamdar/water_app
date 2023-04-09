import 'package:flutter/material.dart';
import 'package:water_app/utils_widgets/water_bar.dart';
import 'package:water_app/utils_widgets/vessels_grid.dart';
import 'package:water_app/utils_widgets/editable_gridview.dart';
import 'package:water_app/pages/settings_page.dart';
import 'package:water_app/classes/vessel.dart';
import 'package:water_app/classes/changeList.dart';
import 'package:provider/provider.dart';

class TestLayout1 extends StatefulWidget {
  const TestLayout1({super.key});

  @override
  State<TestLayout1> createState() => _TestLayout1State();
}

class _TestLayout1State extends State<TestLayout1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Track daily water intake"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
                //do something
              },
            )
          ],
        ),
        body:
            Consumer<VesselsListClass>(builder: (context, vesselsList, child) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
                width: constraints.maxWidth,
                child: Row(children: [
                  Container(
                      color: Color.fromARGB(255, 44, 44, 44),
                      width: constraints.maxWidth * 0.150,
                      height: (constraints.maxHeight),
                      child: WaterBar(
                        filled: vesselsList.expectedWaterIntake,
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
                                    height: constraints.maxHeight * 0.20,
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
          });
        }));
  }
}
