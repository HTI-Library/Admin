import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/models/get_all_types_model.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_text_form_field.dart';
import 'package:hti_library_admin/features/categories/presentation/pages/categories.dart';

import '../../../../core/util/cubit/state.dart';

class TypeItem extends StatelessWidget {
  TypeItem({Key? key, required this.typeModel}) : super(key: key);
  final TypeModel typeModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController libraryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 60.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: HexColor(greyWhite),
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
                  CategoriesPage(
                    library: typeModel.library,
                    type: typeModel.name,
                  ));
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 15.0,
                end: 10.0,
                top: 10.0,
                bottom: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          typeModel.name,
                          textAlign: TextAlign.end,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: HexColor(mainColor),
                                  ),
                          maxLines: 1,
                        ),
                        space5Vertical,
                        Text(
                          typeModel.library,
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: HexColor(mainColor),
                                fontSize: 14.0,
                              ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: Material(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(10.0),
                      color: HexColor(greyWhite),
                      child: IconButton(
                        onPressed: () {
                          nameController.text = typeModel.name;
                          libraryController.text = typeModel.library;
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
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
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
                                            margin: const EdgeInsets.only(
                                                bottom: 15.0),
                                            height: 4,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            decoration: BoxDecoration(
                                              color: HexColor(mainColor),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          AppTextFormField(
                                            type: TextInputType.name,
                                            hint: 'Name',
                                            textEditingController:
                                                nameController,
                                          ),
                                          space15Vertical,
                                          AppTextFormField(
                                            type: TextInputType.name,
                                            hint: 'Library',
                                            textEditingController:
                                                libraryController,
                                          ),
                                          space30Vertical,
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: AppButton(
                                                label: 'SAVE',
                                                onPress: () {},
                                                width: 100.0,
                                              )),
                                              space15Horizontal,
                                              SizedBox(
                                                height: 40.0,
                                                width: 40.0,
                                                child: Material(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: HexColor(greyWhite),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      MainCubit.get(context)
                                                          .deleteType(
                                                        typeID: typeModel.id,
                                                      );
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
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: Icon(
                          Icons.edit_rounded,
                          size: 16.0,
                          color: HexColor(mainColor),
                        ),
                      ),
                    ),
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
