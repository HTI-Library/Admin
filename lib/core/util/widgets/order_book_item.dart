import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/models/top_borrow_model.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';

class OrderBookItem extends StatelessWidget {
  const OrderBookItem({Key? key, required this.model}) : super(key: key);
  final SimpleBook model;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsetsDirectional.only(
        top: 15.0,
        start: 15.0,
        end: 15.0,
      ),
      decoration: BoxDecoration(
        color: HexColor(greyWhite),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 16.0,
                  backgroundImage: NetworkImage(
                      'https://www.darkmatterday.com/wp-content/uploads/2019/09/circle-cropped.png'),
                ),
                space10Horizontal,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ehab Borae',
                        style: Theme.of(context).textTheme.subtitle2,
                        maxLines: 1,
                      ),
                      Text(
                        '42018064',
                        style: Theme.of(context).textTheme.subtitle2,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Text(
                  '42018064',
                  style: Theme.of(context).textTheme.subtitle2,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const Divider(
            height: 0.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            height: MediaQuery.of(context).size.width / 3.9 * 1.6,
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
                    image: NetworkImage(model.bookImage),
                    height: MediaQuery.of(context).size.width / 3.9 * 1.6,
                    width: MediaQuery.of(context).size.width / 3.9,
                    fit: BoxFit.fill,
                  ),
                ),
                space10Horizontal,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: Theme.of(context).textTheme.subtitle2,
                        maxLines: 1,
                      ),
                      Text(
                        '${appTranslation(context).author} : ${model.authors}',
                        style: Theme.of(context).textTheme.subtitle2,
                        maxLines: 1,
                      ),
                      Text(
                        'Edition : ${model.edition}',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        '${appTranslation(context).pagesNum} : ${model.pages}',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AppButton(
                                height: 35.0,
                                color: HexColor(greyWhite),
                                label: appTranslation(context).cancel,
                                textColor: HexColor(mainColor),
                                onPress: () {},),
                          ),
                          space10Horizontal,
                          Expanded(
                            child: AppButton(
                              height: 35.0,
                              label: appTranslation(context).confirm,
                              onPress: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
