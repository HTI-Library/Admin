import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_text_form_field.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/dialog_change_photo.dart';
import 'package:hti_library_admin/features/settings/widget/btn_my_account.dart';

import '../../../../core/util/cubit/state.dart';

// ignore: must_be_immutable
class AddNewBook extends StatelessWidget {
  AddNewBook({Key? key}) : super(key: key);

  TextEditingController libraryController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController bookNameController = TextEditingController();
  TextEditingController bookEditionController = TextEditingController();
  TextEditingController bookAuthorController = TextEditingController();
  TextEditingController pagesController = TextEditingController();
  TextEditingController bookCategoryController = TextEditingController();
  TextEditingController bookNumberController = TextEditingController();
  TextEditingController numberOfCopiesController = TextEditingController();
  TextEditingController classificationNumController = TextEditingController();
  TextEditingController overviewController = TextEditingController();
  GlobalKey<FormState> formKe = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          if (state is CreateBookSuccess) {
            showToast(message: appTranslation(context).addBookSuccess, toastStates: ToastStates.SUCCESS);
          } else if (state is Error) {
            showToast(message: appTranslation(context).addBookError, toastStates: ToastStates.ERROR);
          }
        },
      builder: (context, state) {

        return BackScaffold(
          scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
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
                        appTranslation(context).addBook,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      space15Vertical,
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          if (MainCubit.get(context).imageFile != null)
                            Image(
                              image:
                              FileImage(MainCubit.get(context).imageFile!),
                              width: MediaQuery.of(context).size.width / 2,
                              height:
                              MediaQuery.of(context).size.width / 2 * 1.6,
                              fit: BoxFit.cover,
                            ),
                          if (MainCubit.get(context).imageFile == null)
                            Image(
                              image: const AssetImage(
                                'assets/images/placeholder.jpg',
                              ),
                              width: MediaQuery.of(context).size.width / 2,
                              height:
                              MediaQuery.of(context).size.width / 2 * 1.6,
                              fit: BoxFit.cover,
                            ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: AppButton(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 35.0,
                              color: HexColor(dialogColor),
                              label: appTranslation(context).upload,
                              textColor: Theme.of(context).primaryColorDark,
                              onPress: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                    const DialogChangePhoto());
                              },
                            ),
                          ),
                        ],
                      ),
                      space15Vertical,

                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: MyBtnAccount(
                                voidCallback: () {
                                  MainCubit.get(context).pickPdf();
                                  print('pdf');
                                },
                                text: 'Upload PDF',
                                imagePath: 'info',
                              ),
                            ),
                          ),
                          if (MainCubit.get(context).pdfFile != null)
                            space8Horizontal,
                          if (MainCubit.get(context).pdfFile != null)
                            SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: Material(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(10.0),
                                color: HexColor(greyWhite),
                                child: IconButton(
                                  onPressed: () {
                                    MainCubit.get(context).clearPickedPdf();
                                  },
                                  icon: Icon(
                                    Icons.delete_rounded,
                                    size: 16.0,
                                    color: HexColor(red),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      // if (MainCubit.get(context).pdfFile == null)
                      // MyBtnAccount(
                      //   voidCallback: () {
                      //     print('pdf');
                      //
                      //   },
                      //   text: appTranslation(context).uploadPdf,
                      //   imagePath: 'info',
                      // ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: appTranslation(context).libraryDepartment,
                        textEditingController: libraryController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: appTranslation(context).bookType,
                        textEditingController: typeController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: appTranslation(context).bookName,
                        textEditingController: bookNameController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: appTranslation(context).bookEdition,
                        textEditingController: bookEditionController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: appTranslation(context).bookAuthor,
                        textEditingController: bookAuthorController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: appTranslation(context).bookPages,
                        textEditingController: pagesController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        hint: appTranslation(context).bookCategory,
                        textEditingController: bookCategoryController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: appTranslation(context).bookNumber,
                        textEditingController: bookNumberController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: appTranslation(context).bookCopies,
                        textEditingController: numberOfCopiesController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: 'Classification Number',
                        textEditingController: classificationNumController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.text,
                        hint: 'Overview',
                        textEditingController: overviewController,
                      ),
                      space15Vertical,
                      BuildCondition(
                        condition: state is CreateBookLoading,
                        builder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                        fallback: (context) => AppButton(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 35.0,
                          label: appTranslation(context).addBook,
                          color: Theme.of(context).primaryColor,
                          textColor: HexColor(dialogColor),
                          onPress: () {
                            if (formKe.currentState!.validate()) {
                              MainCubit.get(context).createBook(
                                library: libraryController.text,
                                type: typeController.text,
                                name: bookNameController.text,
                                edition: num.parse(bookEditionController.text),
                                rate: 0,
                                auther: bookAuthorController.text,
                                pages: num.parse(pagesController.text),
                                category: bookCategoryController.text,
                                bookNum: num.parse(bookNumberController.text),
                                amount:
                                num.parse(numberOfCopiesController.text),
                                classificationNum:
                                classificationNumController.text,
                                overview: overviewController.text,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
