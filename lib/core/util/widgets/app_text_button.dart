import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  TextStyle? style;
  ButtonStyle? buttonStyle;

  AppTextButton({
    required this.label,
    required this.onPress,
    this.style,
    this.buttonStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: buttonStyle,
      child: Text(
        label.toUpperCase(),
        style: style == null ? Theme.of(context).textTheme.subtitle2 : null,
      ),
    );
  }
}
