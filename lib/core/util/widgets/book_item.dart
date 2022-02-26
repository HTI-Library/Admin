import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/models/top_borrow_model.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import '../constants.dart';
import 'asset_svg.dart';
import 'available_item.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  final SimpleBook book;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: MediaQuery.of(context).size.width / 3.2 + 1.8,
      margin: const EdgeInsetsDirectional.only(
        start: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // navigateTo(
            //     context,
            //     ViewBookPage(
            //       bookId: book.id,
            //     ));
          },
          child: Padding(
            padding: const EdgeInsets.all(
              5.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image(
                    image: NetworkImage(
                      book.bookImage,
                    ),
                    height: MediaQuery.of(context).size.width / 3.2 * 1.6,
                    width: MediaQuery.of(context).size.width / 3.2,
                    fit: BoxFit.fill,
                  ),
                ),
                space5Vertical,
                Text(
                  book.name,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: MainCubit.get(context).isDark
                          ? HexColor(surface)
                          : HexColor(mainColor)),
                ),
                space5Vertical,
                Row(
                  children: [
                    Text(
                      '${book.rate}',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    space5Horizontal,
                    AssetSvg(
                      imagePath: 'star',
                      color: starColor,
                      size: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: CircleAvatar(
                        radius: 1.5,
                        backgroundColor: HexColor(mainColor),
                      ),
                    ),
                    AvailableItem(
                      amount: book.amount,
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
