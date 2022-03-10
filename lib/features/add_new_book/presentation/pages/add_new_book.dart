import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_text_form_field.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/btn_my_account.dart';

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
                        'Add Book',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Icon(
                            Icons.book_rounded,
                            size: MediaQuery.of(context).size.width / 1.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 70.0),
                            child: AppButton(
                              width: MediaQuery.of(context).size.width / 3.2,
                              height: 35.0,
                              color: HexColor(dialogColor),
                              label: 'Upload Image',
                              textColor: HexColor(mainColor),
                              onPress: () {},
                            ),
                          ),
                        ],
                      ),
                      MyBtnAccount(
                        voidCallback: () {},
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
                      space15Vertical,
                      AppButton(
                        width: MediaQuery.of(context).size.width / 3.2,
                        height: 35.0,
                        color: HexColor(mainColor),
                        label: 'ADD',
                        textColor: HexColor(dialogColor),
                        onPress: () {
                          if (formKe.currentState!.validate()) {

                          }
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
