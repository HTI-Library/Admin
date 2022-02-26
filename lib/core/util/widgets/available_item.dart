import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';

class AvailableItem extends StatelessWidget {
  AvailableItem({
    Key? key,
    required this.amount,
    this.fontSize = 10.0,
  }) : super(key: key);
  final int amount;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 3.0,
      ),
      decoration: BoxDecoration(
        color: amount <= 1 ? HexColor(red) : HexColor(green),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
          amount != 0 ? appTranslation(context).available : appTranslation(context).unavailable,
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: HexColor(surface),
              fontSize: fontSize,
            ),
      ),
    );
  }
}