import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';
import 'asset_svg.dart';

class SeeMoreItem extends StatelessWidget {
  const SeeMoreItem({
    Key? key,
    required this.gestureTapCallback,
    required this.text,
    this.padding = 15,


  }) : super(key: key);
  final GestureTapCallback gestureTapCallback;
  final String text;
  final double padding ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: InkWell(
        onTap: gestureTapCallback,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: HexColor(mainColor),
                      ),
                ),
              ),
              AssetSvg(
                imagePath: 'arrow_right',
                color: HexColor(mainColor),
                size: 18.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
