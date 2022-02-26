import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';

import '../constants.dart';
import 'asset_svg.dart';


class MyThemeIcon extends StatelessWidget {
  final String path;
  final String lightColor;
  final String darkColor;

  const MyThemeIcon({
    Key? key,
    this.lightColor = mainColor,
    this.darkColor = grey,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return AssetSvg(
          color: MainCubit.get(context).isDark ? HexColor(darkColor) : HexColor(lightColor),
          imagePath: path,
        );
      },
    );
  }
}