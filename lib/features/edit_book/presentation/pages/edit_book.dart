import 'package:flutter/cupertino.dart';
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
class EditBook extends StatelessWidget {
  EditBook({Key? key}) : super(key: key);

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
                        'Edit Book',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      space15Vertical,
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Image(
                            image: const NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStNoD1TKSQdOPjyvKkd2wW5OhA6BYNt1vhIwHKWkOywC3tMG1jQUhiSYImWK5rW-hv93U&usqp=CAU'),
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 2 * 1.6,
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
                                color: HexColor(mainColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      space15Vertical,
                      MyBtnAccount(
                        voidCallback: () {},
                        text: 'Upload PDF',
                        imagePath: 'info',
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: 'Library',
                        callbackHandle: (controller) {
                          controller = libraryController;
                        },
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: 'Book Type',
                        callbackHandle: (controller) {
                          controller = typeController;
                        },
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: 'Book Name',
                        callbackHandle: (controller) {
                          controller = bookNameController;
                        },
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: 'Book Edition',
                        callbackHandle: (controller) {
                          controller = bookEditionController;
                        },
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.name,
                        hint: 'Book Author',
                        callbackHandle: (controller) {
                          controller = bookAuthorController;
                        },
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: 'Book Pages',
                        callbackHandle: (controller) {
                          controller = pagesController;
                        },
                      ),
                      space8Vertical,
                      AppTextFormField(
                        hint: 'Book Categories',
                        callbackHandle: (controller) {
                          controller = bookCategoryController;
                        },
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: 'Book Number',
                        callbackHandle: (controller) {
                          controller = bookNumberController;
                        },
                      ),
                      space8Vertical,
                      AppTextFormField(
                        type: TextInputType.number,
                        hint: 'Book Copies',
                        callbackHandle: (controller) {
                          controller = numberOfCopiesController;
                        },
                      ),
                      space15Vertical,
                      AppButton(
                        width: MediaQuery.of(context).size.width / 3.2,
                        height: 35.0,
                        color: HexColor(mainColor),
                        label: 'SAVE',
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
