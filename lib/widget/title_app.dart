import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  final Color fontColor;
  const TitleApp(this.fontColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'title',
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          "Halosis Test",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
