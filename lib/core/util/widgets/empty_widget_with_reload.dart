import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';

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
        Expanded(
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state)=> EmptyWidget(
              text: appTranslation(context).noBooksToPresent,
              image: MainCubit.get(context).isDark? 'empty_dark.png':"EmptyInbox_Monochromatic_light.png",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            elevation: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: onPressed,
            label: Text(appTranslation(context).reload),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ),
      ],
    );
  }
}
