import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';

class LibraryItem extends StatelessWidget {
  const LibraryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: HexColor(greyWhite),
      ),
      padding: const EdgeInsetsDirectional.only(
        start: 15.0,
        end: 10.0,
      ),
      margin: const EdgeInsetsDirectional.only(
        bottom: 15.0,
        start: 15.0,
        end: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'text',
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: HexColor(mainColor),
                  fontSize: 14.0,
                ),
          ),
          const Spacer(),
          SizedBox(
            height: 35.0,
            width: 35.0,
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
