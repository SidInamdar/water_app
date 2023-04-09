import 'package:flutter/foundation.dart';
import 'package:water_app/classes/utils.dart';
import 'package:water_app/classes/vessel.dart';

class VesselsListClass extends ChangeNotifier {
  List<String> _vesselsList = [];
  List<String> _datesList = [];
  List<String> get vesselsList => _vesselsList;
  List<String> get datesList => _datesList;
  double _expectedWaterIntake = 3.0;
  double get expectedWaterIntake => _expectedWaterIntake;
  double _currentWaterIntake = 0.0;
  double get currentWaterIntake => _currentWaterIntake;

  VesselsListClass(List<String> vesselsList, List<String> datesList,
      double expectedWaterIntake, double currentWaterIntake) {
    _vesselsList = vesselsList;
    _datesList = datesList;
    _expectedWaterIntake = expectedWaterIntake;
    _currentWaterIntake = currentWaterIntake;
  }

  static Future<VesselsListClass> createFromMemory() async {
    preferences.resetLocalData();
    var map = await preferences.getVesselsList();
    return VesselsListClass(
      map['vesselsList'].cast<String>(),
      map['datesList'].cast<String>(),
      map['expectedWaterIntake'],
      map['currentWaterIntake'],
    );
  }

  void addItem(String vessel) {
    int hour = DateTime.now().hour;
    int minutes = DateTime.now().minute;
    _vesselsList.add(vessel);
    _datesList.add('${hour}:${minutes}');
    _currentWaterIntake += vesselMap[vessel]!.quantityInML;
    notifyListeners();
    preferences.setVesselsList(_vesselsList, _datesList, _currentWaterIntake);
  }

  void eraseList() {
    _vesselsList = [];
    notifyListeners();
  }

  void deleteItem(int index) {
    _currentWaterIntake -= vesselMap[_vesselsList[index]]!.quantityInML;
    _vesselsList.removeAt(index);
    _datesList.removeAt(index);

    notifyListeners();
    preferences.setVesselsList(_vesselsList, _datesList, _currentWaterIntake);
  }

  void setExpectedWaterIntake(double expectedwaterintake1) {
    _expectedWaterIntake = expectedwaterintake1;
    notifyListeners();
    //print('${_expectedWaterIntake}, ${expectedwaterintake1}');
    preferences.setExpectedWaterIntake(expectedwaterintake1);
  }
}
