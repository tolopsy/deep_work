import 'package:flutter/material.dart';

typedef CallbackSetting = void Function(String, int);

class DeepWorkButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;

  DeepWorkButton(
      {@required this.color,
      @required this.text,
      @required this.size,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(this.text,
          style: TextStyle(color: Colors.white, fontSize: 16.0)),
      onPressed: this.onPressed,
      style: TextButton.styleFrom(
          backgroundColor: this.color, minimumSize: Size(this.size, 36)),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final Color color;
  final String text;
  final int value;
  final String setting;
  final CallbackSetting callback;

  SettingsButton(
      this.color, this.text, this.value, this.setting, this.callback);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(this.text,
          style: TextStyle(color: Colors.white, fontSize: 20.0)),
      onPressed: () => this.callback(this.setting, this.value),
      style: TextButton.styleFrom(backgroundColor: this.color),
    );
  }
}
