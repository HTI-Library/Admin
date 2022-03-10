import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MainCubit.get(context).getAllTypes(library: widget.library);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return BackScaffold(
          title: 'Types In ${widget.library}',
          scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: MainCubit.get(context).getAllTypesModel != null
              ? MainCubit.get(context).getAllTypesModel!.types.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => TypeItem(
                        typeModel: MainCubit.get(context)
                            .getAllTypesModel!
                            .types[index],
                      ),
                      itemCount:
                          MainCubit.get(context).getAllTypesModel!.types.length,
                    )
                  : const EmptyWidget(text: 'There is no types yet')
              : const LoadingWidget(),
          floatingButton: FloatingActionButton.extended(
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
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
