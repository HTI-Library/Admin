import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/cubit/state.dart';

class DialogChangePhoto extends StatelessWidget {
  const DialogChangePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return AlertDialog(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Center(
              child: Text("Choose option",
                  style: Theme.of(context).textTheme.headline6)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 60.0,
                  width: 40.0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      MainCubit.get(context).selectCamera(context);
                    },
                    child: Material(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(10.0),
                      color: HexColor(greyWhite),
                      child: Icon(
                        FontAwesomeIcons.cameraRetro,
                        size: 25.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              space15Horizontal,
              Expanded(
                child: SizedBox(
                  height: 60.0,
                  width: 40.0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      MainCubit.get(context).selectImage(context);
                    },
                    child: Material(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(10.0),
                      color: HexColor(greyWhite),
                      child: Icon(
                        FontAwesomeIcons.solidImages,
                        size: 25.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
