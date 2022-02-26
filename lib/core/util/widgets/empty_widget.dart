import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  final String image;

  const EmptyWidget({
    Key? key,
    required this.text,
     this.image = 'empty.png',

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            color: HexColor(grey),
            image:  AssetImage(
              'assets/images/$image',
            ),
          ),
          space10Vertical,
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: HexColor(grey),
                ),
          ),
        ],
      ),
    );
  }
}
