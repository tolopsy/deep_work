import 'package:flutter/material.dart';
import 'package:deep_work/widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Settings());
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 24.0);
    Color buttonColor = Colors.deepPurple;
    return Container(
        child: GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      childAspectRatio: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: <Widget>[
        Text("Work", style: textStyle),
        Text(""),
        Text(""),
        SettingsButton(buttonColor, "-", -1),
        TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number),
        SettingsButton(buttonColor, "+", 1),
        Text("Short", style: textStyle),
        Text(""),
        Text(""),
        SettingsButton(buttonColor, "-", -1),
        TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number),
        SettingsButton(buttonColor, "+", 1),
        Text("Long", style: textStyle),
        Text(""),
        Text(""),
        SettingsButton(buttonColor, "-", -1),
        TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number),
        SettingsButton(buttonColor, "+", 1),
      ],
      padding: EdgeInsets.all(20.0),
    ));
  }
}
