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
import 'package:hti_library_admin/features/types/presentation/widgets/type_item.dart';

import '../../../../core/util/cubit/state.dart';

class TypesPage extends StatefulWidget {
  const TypesPage({
    Key? key,
    required this.library,
  }) : super(key: key);

  final String library;

  @override
  State<TypesPage> createState() => _TypesPageState();
}

class _TypesPageState extends State<TypesPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController libraryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MainCubit.get(context).getAllTypes(library: widget.library);
    libraryController.text = widget.library;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is DeleteTypeSuccess) {
          MainCubit.get(context).getAllTypes(library: widget.library);
        }
      },
      builder: (context, state) {
        return BackScaffold(
          title: 'Types In ${widget.library}',
          scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: MainCubit.get(context).getAllTypesModel != null
              ? MainCubit.get(context).getAllTypesModel!.types.isNotEmpty
                  ? Column(
                      children: [
                        if (state is EditTypeLoading ||
                            state is DeleteTypeLoading ||
                            state is CreateTypeLoading)
                          const LinearProgressIndicator(),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              MainCubit.get(context)
                                  .getAllTypes(library: widget.library);
                            },
                            child: ListView.builder(
                              itemBuilder: (context, index) => TypeItem(
                                typeModel: MainCubit.get(context)
                                    .getAllTypesModel!
                                    .types[index],
                              ),
                              itemCount: MainCubit.get(context)
                                  .getAllTypesModel!
                                  .types
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
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 15.0),
                                height: 4,
                                width: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                  color: HexColor(mainColor),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              AppTextFormField(
                                type: TextInputType.name,
                                hint: 'Name',
                                textEditingController: nameController,
                              ),
                              space15Vertical,
                              AppTextFormField(
                                type: TextInputType.name,
                                hint: 'Library',
                                textEditingController: libraryController,
                              ),
                              space30Vertical,
                              AppButton(
                                label: 'SAVE',
                                onPress: () {
                                  Navigator.pop(context);
                                  MainCubit.get(context).createType(
                                    library: libraryController.text,
                                    name: nameController.text,
                                  );
                                  libraryController.clear();
                                  nameController.clear();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            label: const Text('Add Type'),
            icon: const Icon(Icons.add),
            backgroundColor: HexColor(mainColor),
          ),
        );
      },
    );
  }
}
