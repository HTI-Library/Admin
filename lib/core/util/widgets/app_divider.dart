import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2.0,
      color: Colors.grey[300],
    );
  }
}
