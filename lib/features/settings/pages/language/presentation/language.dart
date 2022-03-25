import 'package:flutter/material.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/main_scaffold.dart';
import 'package:hti_library_admin/features/settings/widget/btn_my_account.dart';


class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      scaffold: BackScaffold(
        scaffoldBackgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        title: 'Language',
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              space20Vertical,
              MyBtnAccount(voidCallback: () {},
                text: 'Arabic',
                imagePath: '',),
              space10Vertical,
              MyBtnAccount(voidCallback: () {},
                text: 'English', imagePath: '',),
            ],
          ),
        ),
      ),
    );
  }
}
