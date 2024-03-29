import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';

import '../constants.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  final String? image;

  const EmptyWidget({
    Key? key,
    required this.text,
    this.image = 'empty_dark.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image(
            // color: Theme.of(context).primaryColor,
            image:  AssetImage(
              'assets/images/$image',
            ),
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.width / 1.5,
          ),
          space20Vertical,
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ],
      ),
    );
  }
}

