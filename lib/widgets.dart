import 'package:flutter/material.dart';

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