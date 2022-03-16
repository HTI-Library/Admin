import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';
import 'empty_widget.dart';

class EmptyWidgetReload extends StatelessWidget {
  const EmptyWidgetReload({
    Key? key,
    required this.emptyText,
    required this.onPressed,
  }) : super(key: key);
  final String emptyText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Expanded(
          child: EmptyWidget(text: 'No books to present'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            elevation: 0.0,
            backgroundColor: HexColor(mainColor),
            onPressed: onPressed,
            label: const Text('Reload'),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ),
      ],
    );
  }
}
