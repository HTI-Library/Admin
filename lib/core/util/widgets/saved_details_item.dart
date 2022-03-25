import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/widgets/asset_svg.dart';
import 'package:hti_library_admin/core/util/widgets/available_item.dart';

class SavedItem extends StatelessWidget {
  const SavedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: MediaQuery.of(context).size.width / 4.9 * 1.6 + 20,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsetsDirectional.only(
        bottom: 15.0,
        start: 15.0,
        end: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        color: HexColor(greyWhite),
        child: InkWell(
          onTap: () {
            // navigateTo(context, ViewBookPage());
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image(
                    image: const NetworkImage(
                        'https://edit.org/images/cat/book-covers-big-2019101610.jpg'),
                    height: MediaQuery.of(context).size.width / 4.9 * 1.6,
                    width: MediaQuery.of(context).size.width / 4.9,
                    fit: BoxFit.fill,
                  ),
                ),
                space10Horizontal,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Python Programming  ssssss ssss s s s sssssssssssss',
                        style: Theme.of(context).textTheme.subtitle2,
                        maxLines: 2,
                      ),
                      Text(
                        'Author : Franklin',
                        style: Theme.of(context).textTheme.subtitle2,
                        maxLines: 2,
                      ),
                      Text(
                        'Edition : 3th',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        '205, Pages',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Material(
                        color:  HexColor(greyWhite),
                        child: InkWell(
                          onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AssetSvg(
                          imagePath: 'save_soled',
                          color: HexColor(mainColorL),
                        ),
                            )),
                      ),
                    ),
                    const Spacer(),
                    AvailableItem(
                      amount: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
