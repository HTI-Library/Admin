import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';

class TypeItem extends StatelessWidget {
  const TypeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: HexColor(greyWhite),
      ),
      padding: const EdgeInsetsDirectional.only(
        start: 15.0,
        end: 10.0,
        top: 10.0,
        bottom: 10.0,
      ),
      margin: const EdgeInsetsDirectional.only(
        bottom: 15.0,
        start: 15.0,
        end: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: HexColor(mainColor),
                      ),
                  maxLines: 1,
                ),
                space5Vertical,
                Text(
                  'Library',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: HexColor(mainColor),
                        fontSize: 14.0,
                      ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
            width: 40.0,
            child: Material(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(10.0),
              color: HexColor(greyWhite),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                        );
                      });
                },
                icon: Icon(
                  Icons.edit_rounded,
                  size: 16.0,
                  color: HexColor(mainColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
