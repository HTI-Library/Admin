import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_text_form_field.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/loading.dart';
import 'package:hti_library_admin/features/settings/widget/btn_my_account.dart';

import '../../../../core/util/cubit/state.dart';

// ignore: must_be_immutable
class EditBook extends StatefulWidget {
  const EditBook({Key? key, required this.bookId}) : super(key: key);
  final String bookId;

  @override
  State<EditBook> createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  TextEditingController libraryController = TextEditingController();

  TextEditingController typeController = TextEditingController();

  TextEditingController bookNameController = TextEditingController();

  TextEditingController bookEditionController = TextEditingController();

  TextEditingController bookAuthorController = TextEditingController();

  TextEditingController pagesController = TextEditingController();

  TextEditingController bookCategoryController = TextEditingController();

  TextEditingController bookNumberController = TextEditingController();

  TextEditingController numberOfCopiesController = TextEditingController();

  GlobalKey<FormState> formKe = GlobalKey<FormState>();

  void getBookData() {
    libraryController.text = MainCubit.get(context).bookModel!.book.library;

    typeController.text = MainCubit.get(context).bookModel!.book.type;

    bookNameController.text = MainCubit.get(context).bookModel!.book.name;

    bookEditionController.text = MainCubit.get(context).bookModel!.book.edition;

    bookAuthorController.text =
        MainCubit.get(context).bookModel!.book.authors[0].authorName;

    pagesController.text =
        MainCubit.get(context).bookModel!.book.pages.toString();

    bookCategoryController.text =
        MainCubit.get(context).bookModel!.book.category;

    bookNumberController.text = MainCubit.get(context).bookModel!.book.bookNum;

    numberOfCopiesController.text =
        MainCubit.get(context).bookModel!.book.amount.toString();
  }

  @override
  void initState() {
    super.initState();
    MainCubit.get(context).bookDetails(bookId: widget.bookId).then((value) {
      getBookData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return BackScaffold(
          scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: MainCubit.get(context).bookModel != null
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Form(
                        key: formKe,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              appTranslation(context).editBook,
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            space15Vertical,
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                Image(
                                  image: NetworkImage(MainCubit.get(context)
                                      .bookModel!
                                      .book
                                      .bookImage),
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: MediaQuery.of(context).size.width /
                                      2 *
                                      1.6,
                                  fit: BoxFit.cover,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: CircleAvatar(
                                    backgroundColor: HexColor(greyWhite),
                                    radius: 16.0,
                                    child: Icon(
                                      Icons.edit_rounded,
                                      size: 16.0,
                                      color: HexColor(mainColorL),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            space15Vertical,
                            MyBtnAccount(
                              voidCallback: () {},
                              text: appTranslation(context).uploadPdf,
                              imagePath: 'info',
                            ),
                            space8Vertical,
                            AppTextFormField(
                              type: TextInputType.name,
                              hint: appTranslation(context).libraryDepartment,
                              label: appTranslation(context).libraryDepartment,
                              textEditingController: libraryController,
                            ),
                            space8Vertical,
                            AppTextFormField(
                              type: TextInputType.name,
                              hint: appTranslation(context).bookType,
                              label: appTranslation(context).bookType,
                              textEditingController: typeController,
                            ),
                            space8Vertical,
                            AppTextFormField(
                              type: TextInputType.name,
                              hint: appTranslation(context).bookName,
                              label: appTranslation(context).bookName,
                              textEditingController: bookNameController,
                            ),
                            space8Vertical,
                            AppTextFormField(
                              type: TextInputType.number,
                              hint: appTranslation(context).bookEdition,
                              label: appTranslation(context).bookEdition,
                              textEditingController: bookEditionController,
                            ),
                            space8Vertical,
                            AppTextFormField(
                              type: TextInputType.name,
                              hint: appTranslation(context).bookAuthor,
                              label: appTranslation(context).bookAuthor,
                              textEditingController: bookAuthorController,
                            ),
                            space8Vertical,
                            AppTextFormField(
                              type: TextInputType.number,
                              hint: appTranslation(context).bookPages,
                              label: appTranslation(context).bookPages,
                              textEditingController: pagesController,
                            ),
                            space8Vertical,
                            AppTextFormField(
                              hint: appTranslation(context).bookCategory,
                              label: appTranslation(context).bookCategory,
                              textEditingController: bookCategoryController,
                            ),
                            space8Vertical,
                            AppTextFormField(
                              type: TextInputType.number,
                              hint: appTranslation(context).bookNumber,
                              label: appTranslation(context).bookNumber,
                              textEditingController: bookNumberController,
                            ),
                            space8Vertical,
                            AppTextFormField(
                              type: TextInputType.number,
                              hint: appTranslation(context).bookCopies,
                              label: appTranslation(context).bookCopies,
                              textEditingController: numberOfCopiesController,
                            ),
                            space15Vertical,
                            AppButton(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 35.0,
                              color: Theme.of(context).primaryColorDark,
                              label: appTranslation(context).save,
                              textColor: HexColor(dialogColor),
                              onPress: () {
                                if (formKe.currentState!.validate()) {}
                              },
                            ),
                            space30Vertical,
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const LoadingWidget(),
        );
      },
    );
  }
}
