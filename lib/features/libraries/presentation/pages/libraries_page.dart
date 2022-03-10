import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';
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
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => LibraryItem(
                          libraryModel: MainCubit.get(context)
                              .getAllLibraryModel!
                              .libraries[index]),
                      itemCount: MainCubit.get(context)
                          .getAllLibraryModel!
                          .libraries
                          .length,
                    )
                  : const EmptyWidget(text: 'There is no libraries yet')
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
            label: const Text('Add Library'),
            icon: const Icon(Icons.add),
            backgroundColor: HexColor(mainColor),
          ),
        );
      },
    );
  }
}
