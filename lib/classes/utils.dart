import 'package:shared_preferences/shared_preferences.dart';

class preferences {
  static Future<void> setlatestEntryTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('latestEntryTime', DateTime.now().toString());
  }

  static Future<void> resetLocalData() async {
    bool deleteEntireData = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('latestEntryTime')) {
      var date_prev = DateTime.parse(prefs.getString('latestEntryTime')!);
      var date_now = DateTime.now();
      var date_start = DateTime(date_now.year, date_now.month, date_now.day);
      var diff1 = date_now.difference(date_start).inHours;
      var diff2 = date_now.difference(date_prev).inHours;
      bool same_day = (diff2 < diff1) ? true : false;
      if (same_day) {
        deleteEntireData = false;
      }
    }
    if (deleteEntireData) {
      prefs.setStringList('vesselsList', []);
      prefs.setStringList('datesList', []);

      prefs.setDouble('currentWaterIntake', 0.0);
    }
  }

  static Future<void> setVesselsList(
    List<String> vesselsList,
    List<String> datesList,
    double currentWaterIntake,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('vesselsList', vesselsList);
    prefs.setStringList('datesList', datesList);
    prefs.setDouble('currentWaterIntake', currentWaterIntake);
    //prefs.setDouble('expectedWaterIntake', expectedWaterIntake);
  }

  static Future<Map<String, dynamic>> getVesselsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double expected = 3.0 * 1000;
    double current = 0.0;
    if (prefs.containsKey('expectedWaterIntake')) {
      expected = prefs.getDouble('expectedWaterIntake')!;
    } else {
      prefs.setDouble('expectedWaterIntake', expected);
    }
    if (prefs.containsKey('currentWaterIntake')) {
      current = prefs.getDouble('currentWaterIntake')!;
    } else {
      prefs.setDouble('currentWaterIntake', current);
    }

    if (prefs.containsKey('vesselsList')) {
      return {
        'vesselsList': prefs.getStringList('vesselsList')!,
        'datesList': prefs.getStringList('datesList')!,
        'expectedWaterIntake': expected,
        'currentWaterIntake': current
      };
    } else {
      setVesselsList([], [], current);
      return {
        'vesselsList': [],
        'datesList': [],
        'expectedWaterIntake': expected,
        'currentWaterIntake': current
      };
    }
  }

  static Future<void> setExpectedWaterIntake(double? totalwater) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (totalwater == null || totalwater <= 0.0) {
      prefs.setDouble('expectedWaterIntake', 3.0 * 1000);
    } else {
      prefs.setDouble('expectedWaterIntake', totalwater * 1000);
    }
  }
}
