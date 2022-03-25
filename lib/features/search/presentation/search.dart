import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/widgets/app_text_form_field.dart';
import 'package:hti_library_admin/core/util/widgets/asset_svg.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/main_scaffold.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      scaffold: BackScaffold(
        title: 'Search',
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              AppTextFormField(
                hint: 'Search',
                icon: AssetSvg(
                  imagePath: 'search',
                  color: Theme.of(context).primaryColorDark,
                ),
                textEditingController: searchController,
              ),
              space15Vertical,
            ],
          ),
        ),
        scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
