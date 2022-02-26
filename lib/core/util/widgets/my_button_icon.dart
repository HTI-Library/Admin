import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';

class MyButtonIcon extends StatelessWidget {
  final VoidCallback voidCallback;
  final String text;
  final Color color;
  final IconData icon;
  final Color iconColor;
  double radius;
  Color textColor;
  bool stroke;
  FontWeight fontWeight;
  bool assetsShow;
  bool iconShow;
  String? imageAssets;
  double width;
  double height;

  MyButtonIcon({
    Key? key,
    required this.voidCallback,
    required this.text,
    required this.color,
    required this.icon,
    required this.iconColor,
    this.radius = 5.0,
    this.textColor = Colors.white,
    this.stroke = false,
    this.assetsShow = false,
    this.iconShow = true,
    this.imageAssets,
    this.width = 54.0,
    this.height = double.infinity,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed: voidCallback,
        child: Row(
          children: [
            if (iconShow)
              Icon(
                icon,
                color: iconColor,
              ),
            if (assetsShow)
              SvgPicture.asset(
                'assets/images/$imageAssets.svg',
                color: HexColor(grey),
                width: 16.0,
                height: 16.0,
              ),
            space10Horizontal,
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: textColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: stroke ? Border.all(color: HexColor(mainColor)) : null,
        color: color,
      ),
    );
  }
}
