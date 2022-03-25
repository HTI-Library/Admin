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
import '../widgets/library_item.dart';

class LibrariesPage extends StatefulWidget {
  const LibrariesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LibrariesPage> createState() => _LibrariesPageState();
}

class _LibrariesPageState extends State<LibrariesPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MainCubit.get(context).getAllLibraries();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return BackScaffold(
          title: 'Libraries',
          scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: MainCubit.get(context).getAllLibraryModel != null
              ? MainCubit.get(context).getAllLibraryModel!.libraries.isNotEmpty
                  ? Column(
                      children: [
                        if (state is GetAllLibrariesLoading ||
                            state is CreateLibraryLoading || state is EditLibraryLoading)
                          const LinearProgressIndicator(),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              MainCubit.get(context).getAllLibraries();
                            },
                            child: ListView.builder(
                              itemBuilder: (context, index) => LibraryItem(
                                  libraryModel: MainCubit.get(context)
                                      .getAllLibraryModel!
                                      .libraries[index]),
                              itemCount: MainCubit.get(context)
                                  .getAllLibraryModel!
                                  .libraries
                                  .length,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const EmptyWidget(
                      text: 'There is no libraries yet',
                    )
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
                                hint: 'Code',
                                textEditingController: codeController,
                              ),
                              space30Vertical,
                              AppButton(
                                label: 'SAVE',
                                onPress: () {
                                  Navigator.pop(context);
                                  MainCubit.get(context).createLibrary(
                                      code: codeController.text,
                                      name: nameController.text);
                                  codeController.clear();
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
            label: Text(appTranslation(context).addLibrary),
            icon: const Icon(Icons.add),
            backgroundColor: HexColor(mainColor),
          ),
        );
      },
    );
  }
}
