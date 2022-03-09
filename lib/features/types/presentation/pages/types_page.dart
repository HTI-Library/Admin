import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/features/types/presentation/widgets/type_item.dart';

class TypesPage extends StatelessWidget {
  const TypesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackScaffold(
      title: 'Types',
      scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const TypeItem(),
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
              backgroundColor:
              Theme.of(context).scaffoldBackgroundColor,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height /1.5,
                );
              });
        },
        label: const Text('Add Type'),
        icon: const Icon(Icons.add),
        backgroundColor: HexColor(mainColor),
      ),
    );
  }
}
