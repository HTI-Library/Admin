import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';

// ignore: must_be_immutable
class DialogButton extends StatelessWidget {
  final VoidCallback voidCallback;
  final String text;
  Color textColor;
  double height;
  FontWeight fontWeight;

  DialogButton({
    Key? key,
    required this.voidCallback,
    required this.text,
    this.height = 35.0,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        color: HexColor(red),
        onPressed: voidCallback,
        height: height,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: textColor,
                fontWeight: fontWeight,
              ),
        ),
      ),
    );
  }
}
