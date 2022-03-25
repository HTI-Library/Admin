import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
import 'package:hti_library_admin/core/util/widgets/app_button.dart';
import 'package:hti_library_admin/core/util/widgets/app_text_form_field.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/empty_widget.dart';
import 'package:hti_library_admin/core/util/widgets/loading.dart';

import '../../../../core/util/cubit/state.dart';
import '../widgets/cat_item.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({
    Key? key,
    required this.library,
    required this.type,
  }) : super(key: key);

  final String library;
  final String type;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController libraryController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MainCubit.get(context)
        .getAllCategories(type: widget.type, library: widget.library);

    libraryController.text = widget.library;
    typeController.text = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is DeleteCategorySuccess) {
          MainCubit.get(context)
              .getAllCategories(type: widget.type, library: widget.library);
        }
      },
      builder: (context, state) {
        return BackScaffold(
          title: 'Categories  In ${widget.type}',
          scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: MainCubit.get(context).categoriesModel != null
              ? MainCubit.get(context).categoriesModel!.categories.isNotEmpty
                  ? Column(
                      children: [
                        if (state is GetAllCategoriesLoading ||
                            state is DeleteCategoryLoading|| state is EditCatLoading|| state is CreateCategoryLoading)
                          const LinearProgressIndicator(),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              MainCubit.get(context).getAllCategories(
                                  type: widget.type, library: widget.library);
                            },
                            child: ListView.builder(
                              itemBuilder: (context, index) => CatItem(
                                categoryModel: MainCubit.get(context)
                                    .categoriesModel!
                                    .categories[index],
                              ),
                              itemCount: MainCubit.get(context)
                                  .categoriesModel!
                                  .categories
                                  .length,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const EmptyWidget(text: 'There is no types yet')
              : const LoadingWidget(),
          floatingButton: FloatingActionButton.extended(
            onPressed: () {
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
                                hint: 'Type',
                                textEditingController:
                                typeController,
                              ),
                              space15Vertical,
                              AppTextFormField(
                                type: TextInputType.name,
                                hint: 'Library',
                                textEditingController:
                                libraryController,
                              ),
                              space30Vertical,
                              AppButton(
                                label: 'SAVE',
                                onPress: () {
                                  Navigator.pop(context);
                                  MainCubit.get(context)
                                      .createCategory(
                                      library:
                                      libraryController
                                          .text,
                                      name: nameController
                                          .text,
                                      type: typeController
                                          .text);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            label: const Text('Add Category'),
            icon: const Icon(Icons.add),
            backgroundColor: HexColor(mainColorL),
          ),
        );
      },
    );
  }
}
