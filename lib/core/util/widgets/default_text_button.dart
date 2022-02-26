import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  TextStyle? style;
  ButtonStyle? buttonStyle;
  IconData? icons;
  Color? colorsIcon;

  DefaultTextButton({
    required this.label,
    required this.onPress,
    this.style,
    this.buttonStyle,
    this.icons,
    this.colorsIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: buttonStyle,
      child: Row(
        children: [
          Icon(
            icons,
            size: 16.0,
            color: colorsIcon,
          ),
          space5Horizontal,
          Text(
            label,
            style: style,
          ),
        ],
      ),
    );
  }
}
