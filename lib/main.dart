import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_app/classes/changeList.dart';
import 'package:water_app/pages/settings_page.dart';
import 'package:water_app/tests/test_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var vesselsClass = await VesselsListClass.createFromMemory();
  runApp(ChangeNotifierProvider(
      create: (context) => vesselsClass, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: TestLayout1(),
    );
  }
}
