import 'package:flutter/material.dart';
import 'package:hti_library_admin/core/util/widgets/main_scaffold.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      scaffold: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
