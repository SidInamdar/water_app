import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:water_app/classes/changeList.dart';
import 'package:water_app/pages/settings_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("Settings")),
        backgroundColor: Color.fromARGB(255, 44, 44, 44),
        body:
            Consumer<VesselsListClass>(builder: (context, vesselsList, child) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _textFieldController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Mention water quantity (in Litres)',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Colors.white, //<-- SEE HERE
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      double parsedValue = double.parse(value);
                      if (parsedValue == null) {
                        return 'Please enter a valid double';
                      }
                      if (parsedValue <= 0) {
                        return 'Please enter a value greater than zero';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double value = double.parse(_textFieldController.text);
                        Provider.of<VesselsListClass>(context, listen: false)
                            .setExpectedWaterIntake(value * 1000);

                        _textFieldController.clear();

                        Navigator.pop(context);
                        //   //_textFieldController.dispose();
                      }
                      //Navigator.pop(context);
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
