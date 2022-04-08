import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.onPressed,
    this.height = 40.0,
    this.width = 40.0,
    this.iconColor,
    this.backgroundColor,
    required this.icon,
  }) : super(key: key);
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? iconColor;
  final Color? backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(10.0),
        color:
            backgroundColor ?? Theme.of(context).primaryColor.withOpacity(.1),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 16.0,
            color: iconColor ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
