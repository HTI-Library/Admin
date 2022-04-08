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
    return BlocBuilder<MainCubit, MainState>(
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
                        style: Theme.of(context).textTheme.headline6,
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
                              textColor: HexColor(mainColorL),
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
                      if (MainCubit.get(context).pdfFile != null)
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 88,
                              child: MyBtnAccount(
                                voidCallback: () {
                                  MainCubit.get(context).pickPdf();
                                },
                                text: 'Upload PDF',
                                imagePath: 'info',
                              ),
                            ),
                            space8Horizontal,
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
                      if (MainCubit.get(context).pdfFile == null)
                        MyBtnAccount(
                          voidCallback: () {
                            MainCubit.get(context).pickPdf();
                          },
                          text: 'Upload PDF',
                          imagePath: 'info',
                        ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: 'Library',
                        textEditingController: libraryController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: 'Book Type',
                        textEditingController: typeController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: 'Book Name',
                        textEditingController: bookNameController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: 'Book Edition',
                        textEditingController: bookEditionController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: 'Book Author',
                        textEditingController: bookAuthorController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: 'Book Pages',
                        textEditingController: pagesController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        hint: 'Book Categories',
                        textEditingController: bookCategoryController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: 'Book Number',
                        textEditingController: bookNumberController,
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: 'Book Copies',
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
                          color: Theme.of(context).primaryColor,
                          label: 'ADD',
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
                      space30Vertical,
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
