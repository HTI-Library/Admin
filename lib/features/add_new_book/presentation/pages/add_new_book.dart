import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_text_form_field.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
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
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      space15Vertical,
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image(
                            image: const AssetImage(
                              'assets/images/placeholder.jpg',
                            ),
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 2 * 1.6,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: AppButton(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 35.0,
                              color: HexColor(dialogColor),
                              label:  appTranslation(context).upload,
                              textColor: Theme.of(context).primaryColorDark,
                              onPress: () {},
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
                      space15Vertical,
                      AppButton(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 35.0,
                        color: Theme.of(context).primaryColor,
                        label: appTranslation(context).addBook,
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
          ),
        );
      },
    );
  }
}
