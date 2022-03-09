import 'package:flutter/material.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/main_scaffold.dart';
import 'package:hti_library_admin/features/account/widget/btn_my_account.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      scaffold: BackScaffold(
        title: "Info",
        scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              MyBtnAccount(text:'${appTranslation(context).privacyPolicy}' ,voidCallback: (){},imagePath: "",),
              space20Vertical,
              MyBtnAccount(text:'${appTranslation(context).getHelp}' ,voidCallback: (){},imagePath: "",),
              space20Vertical,
              MyBtnAccount(text:'${appTranslation(context).aboutUs}' ,voidCallback: (){},imagePath: "",),
              space20Vertical,
            ],
          ),
        ),

      ),);

  }
}
