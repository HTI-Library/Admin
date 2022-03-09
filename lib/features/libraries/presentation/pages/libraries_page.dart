import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';

import '../widgets/library_item.dart';

class LibrariesPage extends StatelessWidget {
  const LibrariesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      title: 'Libraries',
      scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const LibraryItem(),
        itemCount: 20,
      ),
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
  }
}
