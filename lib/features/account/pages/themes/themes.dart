import 'package:flutter/material.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/main_scaffold.dart';
import 'package:hti_library_admin/features/account/widget/btn_my_account.dart';

class ThemesPage extends StatelessWidget {
  const ThemesPage({Key? key}) : super(key: key);

  // bool isDark = false;
  //
  // void changeMode({bool? fromShared}) {
  //   if(fromShared != null) {
  //     isDark = fromShared;
  //     emit(ChangeModeThemeApp());
  //   } else {
  //     isDark = !isDark;
  //     CashHelper.putBoolean(key: 'dark' , value: isDark ).
  //     then((value) {
  //       emit(ChangeModeThemeApp());
  //
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      scaffold: BackScaffold(
        scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Language',
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              space20Vertical,
              MyBtnAccount(
                voidCallback: () {},
                text: 'Light',
                imagePath: 'sun_mode',
              ),
              space10Vertical,
              MyBtnAccount(
                voidCallback: () {},
                text: 'Dark',
                imagePath: "dark_mode",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
