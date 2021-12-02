import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      minHeight: 3,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.blue,
      ),
      backgroundColor: Colors.white,
    );
  }
}
