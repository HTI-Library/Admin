import 'package:flutter/material.dart';
import 'package:hti_library_admin/core/util/constants.dart';
import 'package:hti_library_admin/core/util/widgets/back_scaffold.dart';
import 'package:hti_library_admin/core/util/widgets/main_scaffold.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      scaffold: BackScaffold(
        scaffoldBackgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        title: '${appTranslation(context).myMessage}',
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/message.png"),
                space20Vertical,
                Text("you don't have message" ,
                  style: Theme.of(context).textTheme .headline6!,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
