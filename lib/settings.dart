import 'package:flutter/material.dart';
import 'package:deep_work/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController workTxt;
  TextEditingController shortBrTxt;
  TextEditingController longBrTxt;

  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const String LONGBREAK = "longBreak";

  int workTime;
  int shortBreak;
  int longBreak;

  SharedPreferences prefs;

  @override
  void initState() {
    workTxt = TextEditingController();
    shortBrTxt = TextEditingController();
    longBrTxt = TextEditingController();
    readSettings();
    super.initState();
  }

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
        SettingsButton(buttonColor, "-", -1, WORKTIME, updateSettings),
        TextField(
          style: textStyle,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: workTxt,
        ),
        SettingsButton(buttonColor, "+", 1, WORKTIME, updateSettings),
        Text("Short", style: textStyle),
        Text(""),
        Text(""),
        SettingsButton(buttonColor, "-", -1, SHORTBREAK, updateSettings),
        TextField(
          style: textStyle,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: shortBrTxt,
        ),
        SettingsButton(buttonColor, "+", 1, SHORTBREAK, updateSettings),
        Text("Long", style: textStyle),
        Text(""),
        Text(""),
        SettingsButton(buttonColor, "-", -1, LONGBREAK, updateSettings),
        TextField(
          style: textStyle,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: longBrTxt,
        ),
        SettingsButton(buttonColor, "+", 1, LONGBREAK, updateSettings),
      ],
      padding: EdgeInsets.all(20.0),
    ));
  }

  readSettings() async {
    prefs = await SharedPreferences.getInstance();
    int workTime = prefs.getInt(WORKTIME);
    if (workTime == null) {
      await prefs.setInt(WORKTIME, int.parse('30'));
    }

    int shortBreak = prefs.getInt(SHORTBREAK);
    if (shortBreak == null) {
      await prefs.setInt(SHORTBREAK, int.parse('5'));
    }

    int longBreak = prefs.getInt(LONGBREAK);
    if (longBreak == null) {
      await prefs.setInt(LONGBREAK, int.parse('20'));
    }

    setState(() {
      workTxt.text = workTime.toString();
      shortBrTxt.text = shortBreak.toString();
      longBrTxt.text = longBreak.toString();
    });
  }

  void updateSettings(String key, int value) {
    switch (key) {
      case WORKTIME:
        {
          int work = prefs.getInt(WORKTIME);
          work += value;

          if (work >= 1 && work <= 180) {
            prefs.setInt(WORKTIME, work);
            setState(() {
              workTxt.text = work.toString();
            });
          }
        }
        break;

      case SHORTBREAK:
        {
          int short = prefs.getInt(SHORTBREAK);
          short += value;

          if (short >= 1 && short <= 120) {
            prefs.setInt(SHORTBREAK, short);
            setState(() {
              shortBrTxt.text = short.toString();
            });
          }
        }
        break;

      case LONGBREAK:
        {
          int long = prefs.getInt(SHORTBREAK);
          long += value;

          if (long >= 1 && long <= 120) {
            prefs.setInt(SHORTBREAK, long);
            setState(() {
              shortBrTxt.text = long.toString();
            });
          }
        }
        break;
    }
  }
}
