import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/models/top_borrow_model.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/default_text_button.dart';
import 'package:hti_library_admin/features/edit_book/presentation/pages/edit_book.dart';

class BookItem extends StatelessWidget {
  const BookItem({Key? key, required this.model}) : super(key: key);
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
                        label: appTranslation(context).delete,
                        textColor: HexColor(red),
                        onPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => const DeleteBookDialog(),
                          );
                        },
                      ),
                    ),
                    space10Horizontal,
                    Expanded(
                      child: AppButton(
                        height: 35.0,
                        label: appTranslation(context).edit,
                        onPress: () {
                          navigateTo(context, EditBook());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeleteBookDialog extends StatelessWidget {
  const DeleteBookDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: HexColor(dialogColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      contentPadding: EdgeInsets.zero,
      titlePadding: const EdgeInsetsDirectional.only(top: 15.0, start: 15.0),
      actionsOverflowButtonSpacing: 0.0,
      actionsPadding: const EdgeInsetsDirectional.only(
        end: 10.0,
        bottom: 5.0,
      ),
      insetPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.start,
      title: Text(
        appTranslation(context).deleteBook,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: HexColor(mainColor),
            ),
      ),
      actions: [
        Row(
          children: [
            DefaultTextButton(
                label: appTranslation(context).cancel,
                onPress: () {
                  Navigator.pop(context);
                }),
            DefaultTextButton(
              label: appTranslation(context).delete,
              onPress: () {},
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: HexColor(red),
                  ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ],
    );
  }
}
