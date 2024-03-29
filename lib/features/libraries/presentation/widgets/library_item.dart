import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/models/get_all_library_model.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_icon_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_text_form_field.dart';
import 'package:hti_library_admin/features/types/presentation/pages/types_page.dart';

import '../../../../core/util/cubit/state.dart';

class LibraryItem extends StatelessWidget {
  LibraryItem({Key? key, required this.libraryModel}) : super(key: key);
  final LibraryModel libraryModel;

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // height: 50.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).primaryColorLight,
          ),
          margin: const EdgeInsetsDirectional.only(
            bottom: 15.0,
            start: 15.0,
            end: 15.0,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: () {
              navigateTo(
                  context,
                  TypesPage(
                    library: libraryModel.name,
                  ));
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 15.0,
                top: 10.0,
                bottom: 10.0,
                end: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    libraryModel.name,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14.0,
                        ),
                  ),
                  const Spacer(),
                  AppIconButton(
                    width: 35.0,
                    height: 35.0,
                    onPressed: () {
                      nameController.text = libraryModel.name;
                      codeController.text = libraryModel.code;
                      showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 15.0),
                                        height: 4,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        decoration: BoxDecoration(
                                          color: HexColor(mainColorL),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      AppTextFormField(
                                        type: TextInputType.name,
                                        hint: appTranslation(context).name,
                                        textEditingController: nameController,
                                      ),
                                      space15Vertical,
                                      AppTextFormField(
                                        type: TextInputType.name,
                                        hint: appTranslation(context).code,
                                        textEditingController: codeController,
                                      ),
                                      space30Vertical,
                                      Row(
                                        children: [
                                          Expanded(
                                              child: AppButton(
                                            label: appTranslation(context).save,
                                            onPress: () {
                                              Navigator.pop(context);
                                              MainCubit.get(context)
                                                  .editLibrary(
                                                      name: nameController.text,
                                                      code: codeController.text,
                                                      libraryID:
                                                          libraryModel.id);
                                            },
                                            width: 100.0,
                                          )),
                                          space15Horizontal,
                                          AppIconButton(
                                            height: 40.0,
                                            width: 40.0,
                                            backgroundColor: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(.15),
                                            iconColor: HexColor(red),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              MainCubit.get(context)
                                                  .deleteLibrary(
                                                library: libraryModel.id,
                                              );
                                            },
                                            icon: Icons.delete_rounded,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    icon: Icons.edit_rounded,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
